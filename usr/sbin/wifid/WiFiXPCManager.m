@implementation WiFiXPCManager

- (void)XPCManager:(id)a3 invalidatedXPCConnection:(id)a4
{
  void *v6;
  NSObject *v7;
  _QWORD v8[6];

  v6 = objc_autoreleasePoolPush();
  v7 = sub_100031A60((uint64_t)self->_managerRef);
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002FB7C;
    v8[3] = &unk_10022EB70;
    v8[4] = self;
    v8[5] = a4;
    dispatch_async(v7, v8);
  }
  objc_autoreleasePoolPop(v6);
}

- (id)__peerAssistedDiscoveryNetworksForUUID:(id)a3
{
  NSObject *mutexQueue;
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
  v10 = sub_10002FAB8;
  v11 = sub_10002F9B0;
  v12 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009790;
  block[3] = &unk_1002323E0;
  block[4] = a3;
  block[5] = self;
  block[6] = &v7;
  dispatch_sync(mutexQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)__isActivityRegisteredWithType:(int64_t)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[CWFXPCManager registeredActivities](self->_XPCManager, "registeredActivities", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "type") == (id)a3)
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return (char)v5;
}

+ (id)sharedXPCManager
{
  if (qword_10026DB90 != -1)
    dispatch_once(&qword_10026DB90, &stru_100232478);
  return (id)qword_10026DB88;
}

- (BOOL)isWiFiBoundActivityRegistered
{
  return -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 3);
}

- (BOOL)isForegroundActivityRegistered
{
  return -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 2);
}

- (BOOL)isBackgroundActivityRegistered
{
  return -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 1);
}

- (BOOL)isWoWActivityRegistered
{
  return -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 4);
}

- (BOOL)isQuiesceWiFiActivityRegistered
{
  return -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 5);
}

- (BOOL)isDisableAutoJoinActivityRegistered
{
  return -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 6);
}

- (id)__supportedRequestTypes
{
  return &off_1002540E8;
}

- (__WiFiDeviceManager)__deviceManagerWithInterfaceName:(id)a3
{
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex v6;
  const void *ValueAtIndex;
  uint64_t v8;
  __CFArray *v9;
  const __CFArray *v10;
  CFIndex v11;
  const __CFDictionary *v12;
  void *Value;
  CFTypeRef v14;

  if (a3)
  {
    v4 = sub_10000B29C((CFArrayRef)self->_managerRef);
    if (v4)
    {
      v5 = v4;
      if (CFArrayGetCount(v4) < 1)
      {
        CFRelease(v5);
      }
      else
      {
        v6 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v5, v6);
          v8 = sub_1000161D4((uint64_t)ValueAtIndex);
          if (v8 && (v9 = sub_10000DF90(v8)) != 0)
          {
            v10 = v9;
            if (CFArrayGetCount(v9) < 1)
            {
              v14 = 0;
            }
            else
            {
              v11 = 0;
              do
              {
                v12 = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v11);
                Value = (void *)CFDictionaryGetValue(v12, CFSTR("VIRT_IF_NAME"));
                if (Value && objc_msgSend(Value, "isEqualToString:", a3))
                  v14 = CFRetain(ValueAtIndex);
                else
                  v14 = 0;
                ++v11;
              }
              while (CFArrayGetCount(v10) > v11 && !v14);
            }
            CFRelease(v10);
          }
          else
          {
            v14 = 0;
          }
          ++v6;
        }
        while (CFArrayGetCount(v5) > v6 && !v14);
        CFRelease(v5);
        if (v14)
          return (__WiFiDeviceManager *)CFAutorelease(v14);
      }
    }
  }
  return 0;
}

- (__WiFiNetwork)__copyCurrentSessionBasedNetworkRef
{
  return (__WiFiNetwork *)sub_1000A2248((const __CFArray *)self->_managerRef);
}

- (__WiFiNetwork)__copyCurrentNetworkRef
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const void *ValueAtIndex;
  uint64_t v8;
  const void *v9;
  __WiFiNetwork *v10;

  v2 = sub_10000B29C((CFArrayRef)self->_managerRef);
  if (!v2)
    return 0;
  v3 = v2;
  Count = CFArrayGetCount(v2);
  if (Count < 1)
  {
    v10 = 0;
  }
  else
  {
    v5 = Count;
    v6 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
      v8 = sub_1000161D4((uint64_t)ValueAtIndex);
      if (v8 && (v9 = (const void *)sub_100029860(v8)) != 0)
        v10 = (__WiFiNetwork *)sub_1000169FC((uint64_t)ValueAtIndex, v9);
      else
        v10 = 0;
      ++v6;
    }
    while (v5 > v6 && !v10);
  }
  CFRelease(v3);
  return v10;
}

- (__WiFiNetwork)__copyCurrentKnownNetworkRef
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const void *ValueAtIndex;
  uint64_t v8;
  const void *v9;
  __WiFiNetwork *v10;

  v2 = sub_10000B29C((CFArrayRef)self->_managerRef);
  if (!v2)
    return 0;
  v3 = v2;
  Count = CFArrayGetCount(v2);
  if (Count < 1)
  {
    v10 = 0;
  }
  else
  {
    v5 = Count;
    v6 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
      v8 = sub_1000161D4((uint64_t)ValueAtIndex);
      if (v8 && (v9 = (const void *)sub_100029860(v8)) != 0)
        v10 = (__WiFiNetwork *)sub_10010A058((uint64_t)ValueAtIndex, v9);
      else
        v10 = 0;
      ++v6;
    }
    while (v5 > v6 && !v10);
  }
  CFRelease(v3);
  return v10;
}

- (id)__copyCurrentNetworkHotspotNetwork
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  uint64_t v7;
  void *v8;

  v2 = sub_10000B29C((CFArrayRef)self->_managerRef);
  if (!v2)
    return 0;
  v3 = v2;
  Count = CFArrayGetCount(v2);
  if (Count < 1)
  {
    v8 = 0;
  }
  else
  {
    v5 = Count;
    v6 = 0;
    do
    {
      CFArrayGetValueAtIndex(v3, v6);
      v7 = sub_1001233D0();
      v8 = (void *)v7;
      ++v6;
    }
    while (v5 > v6 && !v7);
  }
  CFRelease(v3);
  return v8;
}

- (__WiFiNetwork)copyCachedCurrentNetworkRef:(id)a3
{
  id v5;
  __WiFiNetwork *v6;

  objc_sync_enter(self);
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_currentNetworkMap, "objectForKeyedSubscript:", a3);
  if (v5)
    v6 = (__WiFiNetwork *)sub_10002B2DC((uint64_t)kCFAllocatorDefault, (uint64_t)v5);
  else
    v6 = 0;
  objc_sync_exit(self);
  return v6;
}

- (void)setCachedCurrentNetworkRef:(__WiFiNetwork *)a3 interfaceName:(id)a4
{
  _WORD *v7;
  NSMutableDictionary *currentNetworkMap;

  objc_sync_enter(self);
  if (a3)
  {
    v7 = sub_10002B2DC((uint64_t)kCFAllocatorDefault, (uint64_t)a3);
    currentNetworkMap = self->_currentNetworkMap;
    if (v7)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](currentNetworkMap, "setObject:forKeyedSubscript:", v7, a4);
      CFRelease(v7);
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](currentNetworkMap, "setObject:forKeyedSubscript:", 0, a4);
    }
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentNetworkMap, "setObject:forKeyedSubscript:", 0, a4);
  }
  objc_sync_exit(self);
}

- (__WiFiNetwork)copyCachedCurrentKnownNetworkRef:(id)a3
{
  id v5;
  __WiFiNetwork *v6;

  objc_sync_enter(self);
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_currentKnownNetworkMap, "objectForKeyedSubscript:", a3);
  if (v5)
    v6 = (__WiFiNetwork *)sub_10002B2DC((uint64_t)kCFAllocatorDefault, (uint64_t)v5);
  else
    v6 = 0;
  objc_sync_exit(self);
  return v6;
}

- (void)setCachedCurrentKnownNetworkRef:(__WiFiNetwork *)a3 interfaceName:(id)a4
{
  _WORD *v7;
  NSMutableDictionary *currentKnownNetworkMap;

  objc_sync_enter(self);
  if (a3)
  {
    v7 = sub_10002B2DC((uint64_t)kCFAllocatorDefault, (uint64_t)a3);
    currentKnownNetworkMap = self->_currentKnownNetworkMap;
    if (v7)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](currentKnownNetworkMap, "setObject:forKeyedSubscript:", v7, a4);
      CFRelease(v7);
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](currentKnownNetworkMap, "setObject:forKeyedSubscript:", 0, a4);
    }
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentKnownNetworkMap, "setObject:forKeyedSubscript:", 0, a4);
  }
  objc_sync_exit(self);
}

- (id)copyCachedCurrentHotspotNetwork
{
  id v3;

  objc_sync_enter(self);
  v3 = -[CWFScanResult copy](self->_currentHotspotNetwork, "copy");
  objc_sync_exit(self);
  return v3;
}

- (void)setCachedCurrentHotspotNetwork:(id)a3
{
  void *v5;

  v5 = objc_autoreleasePoolPush();
  objc_sync_enter(self);

  self->_currentHotspotNetwork = (CWFScanResult *)objc_msgSend(a3, "copy");
  objc_sync_exit(self);
  objc_autoreleasePoolPop(v5);
}

- (__WiFiNetwork)copyCachedCurrentSessionBasedNetworkRef
{
  __WiFiNetwork *cachedCurrentSessionBasedNetworkRef;
  __WiFiNetwork *v4;

  objc_sync_enter(self);
  cachedCurrentSessionBasedNetworkRef = self->_cachedCurrentSessionBasedNetworkRef;
  if (cachedCurrentSessionBasedNetworkRef)
    v4 = (__WiFiNetwork *)sub_10002B2DC((uint64_t)kCFAllocatorDefault, (uint64_t)cachedCurrentSessionBasedNetworkRef);
  else
    v4 = 0;
  objc_sync_exit(self);
  return v4;
}

- (void)setCachedCurrentSessionBasedNetworkRef:(__WiFiNetwork *)a3
{
  __WiFiNetwork *cachedCurrentSessionBasedNetworkRef;

  objc_sync_enter(self);
  cachedCurrentSessionBasedNetworkRef = self->_cachedCurrentSessionBasedNetworkRef;
  if (cachedCurrentSessionBasedNetworkRef)
  {
    CFRelease(cachedCurrentSessionBasedNetworkRef);
    self->_cachedCurrentSessionBasedNetworkRef = 0;
  }
  if (a3)
    self->_cachedCurrentSessionBasedNetworkRef = (__WiFiNetwork *)sub_10002B2DC((uint64_t)kCFAllocatorDefault, (uint64_t)a3);
  objc_sync_exit(self);
}

- (void)__getDeviceUUID:(id)a3
{
  const __SCPreferences *v4;
  id v5;
  id v6;
  void (**v7)(id, _QWORD, id);

  v4 = sub_100092D68(self->_managerRef, CFSTR("DeviceUUID"));
  if (v4)
    v5 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v4);
  else
    v5 = 0;
  v6 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CWFXPCResultKey);
  if (objc_msgSend(a3, "response"))
  {
    v7 = (void (**)(id, _QWORD, id))objc_msgSend(a3, "response");
    v7[2](v7, 0, v6);
  }
}

- (void)__getCurrentScanResult:(id)a3
{
  id v5;
  unsigned int v6;
  NSObject *v7;
  id v8;
  __WiFiNetwork *v9;
  id v10;
  __WiFiNetwork *v11;
  __WiFiNetwork *v12;
  __WiFiNetwork *v13;
  void *v14;
  id v15;
  void (**v16)(id, _QWORD, id);
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCForceNoCacheKey), "BOOLValue");
  if (v6)
  {
    v7 = CWFGetOSLog() ? CWFGetOSLog() : &_os_log_default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136446722;
      v18 = "-[WiFiXPCManager __getCurrentScanResult:]";
      v19 = 2082;
      v20 = "WiFiXPCManager.m";
      v21 = 1024;
      v22 = 411;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[corewifi] %{public}s (%{public}s:%u) Forcing non-cached query of current scan result", &v17, 28);
    }
  }
  if (objc_msgSend(objc_msgSend(a3, "requestParameters"), "virtualInterfaceRole") == 10)
  {
    if (v6)
      v8 = -[WiFiXPCManager __copyCurrentNetworkHotspotNetwork](self, "__copyCurrentNetworkHotspotNetwork");
    else
      v8 = -[WiFiXPCManager copyCachedCurrentHotspotNetwork](self, "copyCachedCurrentHotspotNetwork");
    v10 = v8;
  }
  else
  {
    if (v6)
      v9 = -[WiFiXPCManager __copyCurrentNetworkRef](self, "__copyCurrentNetworkRef");
    else
      v9 = -[WiFiXPCManager copyCachedCurrentNetworkRef:](self, "copyCachedCurrentNetworkRef:", objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName"));
    v11 = v9;
    if (v9)
    {
      v10 = sub_100027D10((uint64_t)v9);
      if (v6)
        v12 = -[WiFiXPCManager __copyCurrentKnownNetworkRef](self, "__copyCurrentKnownNetworkRef");
      else
        v12 = -[WiFiXPCManager copyCachedCurrentKnownNetworkRef:](self, "copyCachedCurrentKnownNetworkRef:", objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName"));
      v13 = v12;
      if (v12)
      {
        v14 = sub_100026664((CFDictionaryRef *)v12);
        if (v14)
          v10 = objc_msgSend(v10, "scanResultWithMatchingKnownNetworkProfile:", v14);
        CFRelease(v13);
      }
      CFRelease(v11);
    }
    else
    {
      v10 = 0;
    }
  }
  v15 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CWFXPCResultKey);
  if (objc_msgSend(a3, "response"))
  {
    v16 = (void (**)(id, _QWORD, id))objc_msgSend(a3, "response");
    v16[2](v16, 0, v15);
  }
}

- (void)__getCurrentNetworkProfile:(id)a3 XPCConnection:(id)a4
{
  id v7;
  NSObject *v8;
  __WiFiNetwork *v9;
  __WiFiNetwork *v10;
  __WiFiNetwork *v11;
  id v12;
  void *v13;
  __WiFiNetwork *v14;
  const __CFString *v15;
  const __CFString *v16;
  _BOOL8 v17;
  int v18;
  uint64_t v19;
  const __CFAllocator *Default;
  CFNumberRef v21;
  CFNumberRef v22;
  void *v23;
  void *v24;
  NSError *v25;
  id v26;
  int valuePtr;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

  v7 = objc_msgSend(a3, "info");
  if (objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", CWFXPCForceNoCacheKey), "BOOLValue"))
  {
    if (CWFGetOSLog())
      v8 = CWFGetOSLog();
    else
      v8 = &_os_log_default;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      valuePtr = 136446722;
      v28 = "-[WiFiXPCManager __getCurrentNetworkProfile:XPCConnection:]";
      v29 = 2082;
      v30 = "WiFiXPCManager.m";
      v31 = 1024;
      v32 = 454;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[corewifi] %{public}s (%{public}s:%u) Forcing non-cached query of current network profile", &valuePtr, 28);
    }
    v9 = -[WiFiXPCManager __copyCurrentSessionBasedNetworkRef](self, "__copyCurrentSessionBasedNetworkRef");
    v10 = -[WiFiXPCManager __copyCurrentKnownNetworkRef](self, "__copyCurrentKnownNetworkRef");
  }
  else
  {
    v9 = -[WiFiXPCManager copyCachedCurrentSessionBasedNetworkRef](self, "copyCachedCurrentSessionBasedNetworkRef");
    v10 = -[WiFiXPCManager copyCachedCurrentKnownNetworkRef:](self, "copyCachedCurrentKnownNetworkRef:", objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName"));
  }
  v11 = v10;
  if (objc_msgSend(objc_msgSend(a3, "requestParameters"), "virtualInterfaceRole") == 10)
  {
    v12 = -[WiFiXPCManager copyCachedCurrentHotspotNetwork](self, "copyCachedCurrentHotspotNetwork");
    if (v12)
    {
      v13 = v12;
      if (v11)
        CFRelease(v11);
      if (objc_msgSend(v13, "matchingKnownNetworkProfile"))
        v14 = (__WiFiNetwork *)sub_1000CCB10(objc_msgSend(v13, "matchingKnownNetworkProfile"), 0);
      else
        v14 = (__WiFiNetwork *)sub_1000CE200(v13);
      v11 = v14;
      if (v14)
        sub_10002C478((uint64_t)v14, CFSTR("IsPersonalHotspot"), kCFBooleanTrue);

    }
  }
  if (v11)
  {
    v15 = sub_10003149C(v9);
    v16 = sub_10003149C(v11);
    v17 = 0;
    if (v15 && v16)
      v17 = CFEqual(v15, v16) != 0;
    if (sub_10002DAB4((uint64_t)v11)
      && objc_msgSend(objc_msgSend(a4, "valueForEntitlement:", CFSTR("com.apple.wifi.eap-nearby-device-setup-config-copy")), "BOOLValue"))
    {
      valuePtr = -1431655766;
      v18 = sub_10011A820(v11);
      valuePtr = v18;
      v19 = sub_1000E7240(v18);
      if (v18 == 1 && !sub_10011A888(v11))
      {
        valuePtr = 4;
        Default = CFAllocatorGetDefault();
        v21 = CFNumberCreate(Default, kCFNumberIntType, &valuePtr);
        if (v21)
        {
          v22 = v21;
          sub_10002C478((uint64_t)v11, CFSTR("ShareableStatus"), v21);
          CFRelease(v22);
        }
      }
    }
    else
    {
      v19 = 0;
    }
    v23 = sub_100026664((CFDictionaryRef *)v11);
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "setSessionBased:", v17);
      objc_msgSend(v24, "setNearbyShareableStatus:", v19);
    }
    v25 = 0;
    if (v9)
      goto LABEL_33;
  }
  else
  {
    v25 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0);
    v24 = 0;
    if (v9)
LABEL_33:
      CFRelease(v9);
  }
  if (v11)
    CFRelease(v11);
  if (v25)
  {
    if (!objc_msgSend(a3, "response"))
      return;
  }
  else
  {
    v26 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v24, CWFXPCResultKey);
    if (!objc_msgSend(a3, "response"))
      return;
  }
  (*((void (**)(void))objc_msgSend(a3, "response") + 2))();
}

- (void)__getKnownNetworkProfiles:(id)a3
{
  id v5;
  id v6;
  CFArrayRef v7;
  const __CFArray *v8;
  __WiFiNetwork *v9;
  __WiFiNetwork *v10;
  const __CFString *v11;
  id v12;
  CFIndex v13;
  void *ValueAtIndex;
  const __CFString *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCNetworkProfilePropertiesKey);
  v7 = sub_100090DA4((uint64_t)self->_managerRef);
  if (v7)
  {
    v8 = v7;
    v9 = -[WiFiXPCManager __copyCurrentSessionBasedNetworkRef](self, "__copyCurrentSessionBasedNetworkRef");
    v10 = v9;
    if (v9)
      v11 = sub_10003149C(v9);
    else
      v11 = 0;
    v12 = +[NSMutableArray array](NSMutableArray, "array");
    if (CFArrayGetCount(v8) >= 1)
    {
      v13 = 0;
      do
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v8, v13);
        v15 = sub_10003149C(ValueAtIndex);
        v16 = 0;
        if (v11 && v15)
          v16 = CFEqual(v11, v15) != 0;
        v17 = sub_100026664((CFDictionaryRef *)ValueAtIndex);
        if (v17)
        {
          v18 = v17;
          objc_msgSend(v17, "setSessionBased:", v16);
          objc_msgSend(v12, "addObject:", objc_msgSend(v18, "filteredNetworkProfileWithProperties:", v6));
        }
        ++v13;
      }
      while (CFArrayGetCount(v8) > v13);
    }
    if (v10)
      CFRelease(v10);
    CFRelease(v8);
  }
  else
  {
    if (+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0))
    {
      if (objc_msgSend(a3, "response"))
        goto LABEL_17;
      return;
    }
    v12 = 0;
  }
  v19 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v20 = objc_msgSend(v12, "copy");
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CWFXPCResultKey);
  if (objc_msgSend(a3, "response"))
LABEL_17:
    (*((void (**)(void))objc_msgSend(a3, "response") + 2))();
}

- (void)__getThermalIndex:(id)a3
{
  uint64_t v4;
  id v5;
  NSNumber *v6;
  void (**v7)(id, _QWORD, id);

  v4 = sub_10009F938((uint64_t)self->_managerRef);
  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CWFXPCResultKey);
  if (objc_msgSend(a3, "response"))
  {
    v7 = (void (**)(id, _QWORD, id))objc_msgSend(a3, "response");
    v7[2](v7, 0, v5);
  }
}

- (void)__getCountryBandSupport:(id)a3
{
  uint64_t v4;
  id v5;
  NSNumber *v6;
  void (**v7)(id, _QWORD, id);

  v4 = sub_10009F940(self->_managerRef);
  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CWFXPCResultKey);
  if (objc_msgSend(a3, "response"))
  {
    v7 = (void (**)(id, _QWORD, id))objc_msgSend(a3, "response");
    v7[2](v7, 0, v5);
  }
}

- (void)__setThermalIndex:(id)a3
{
  id v5;
  id v6;
  NSError *v7;
  void (**v8)(id, NSError *, _QWORD);

  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCThermalIndexKey);
  if (v6)
  {
    sub_10009F9BC((uint64_t)self->_managerRef, (uint64_t)objc_msgSend(v6, "unsignedIntValue"));
    v7 = 0;
  }
  else
  {
    v7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0);
  }
  if (objc_msgSend(a3, "response"))
  {
    v8 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v8[2](v8, v7, 0);
  }
}

- (void)__setCompanionCountryCode:(id)a3
{
  id v5;
  id v6;
  NSError *v7;
  void (**v8)(id, NSError *, _QWORD);

  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCCountryCodeKey);
  if (v6)
  {
    sub_10009C654((uint64_t)self->_managerRef, objc_msgSend(v6, "stringValue"));
    sub_1000AD9AC((uint64_t)self->_managerRef, 1);
    v7 = 0;
  }
  else
  {
    v7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0);
  }
  if (objc_msgSend(a3, "response"))
  {
    v8 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v8[2](v8, v7, 0);
  }
}

- (void)__setPeerAssistedDiscoveryNetwork:(id)a3 interfaceName:(id)a4 UUID:(id)a5
{
  NSObject *mutexQueue;
  _QWORD v6[8];

  mutexQueue = self->_mutexQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10014A7E4;
  v6[3] = &unk_100232408;
  v6[4] = a5;
  v6[5] = a4;
  v6[6] = self;
  v6[7] = a3;
  dispatch_async(mutexQueue, v6);
}

- (void)__startAWDLPeerAssistedDiscovery:(id)a3 XPCConnection:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  __WiFiDeviceManager *v13;
  uint64_t v14;
  id v15;
  ether_addr *v16;
  id v17;
  void *v18;
  int v19;
  NSErrorDomain v20;
  uint64_t v21;
  NSError *v22;
  void (**v23)(id, NSError *, _QWORD);
  _QWORD aBlock[8];
  unsigned __int16 v25;

  v7 = a3;
  v8 = objc_msgSend(a3, "info");
  v9 = objc_msgSend(v8, "objectForKeyedSubscript:", CWFXPCAWDLPeerAssistedDiscoveryParamsKey);
  if (!v9
    || (v10 = v9, (v11 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    v20 = NSPOSIXErrorDomain;
    v21 = 22;
    goto LABEL_37;
  }
  v12 = v11;
  v13 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
  if (!v13)
  {
    v20 = NSPOSIXErrorDomain;
    v21 = 6;
    goto LABEL_37;
  }
  v14 = (uint64_t)v13;
  if (objc_msgSend(-[WiFiXPCManager __peerAssistedDiscoveryNetworksForUUID:](self, "__peerAssistedDiscoveryNetworksForUUID:", objc_msgSend(a4, "UUID")), "objectForKeyedSubscript:", v12))
  {
    v20 = NSPOSIXErrorDomain;
    v21 = 37;
    goto LABEL_37;
  }
  v15 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (objc_msgSend(v10, "peerMACAddress"))
  {
    v16 = ether_aton((const char *)objc_msgSend(objc_msgSend(v10, "peerMACAddress"), "UTF8String"));
    if (v16)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v16, 6), CFSTR("AWDL_IF_MAC_ADDRESS"));
  }
  if (objc_msgSend(v10, "peerMasterChannel"))
    objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "peerMasterChannel")), CFSTR("AWDL_INFO_PEER_MASTER_CHANNEL"));
  if (objc_msgSend(v10, "peerPreferredChannel"))
    objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "peerPreferredChannel")), CFSTR("AWDL_INFO_PREFERRED_CHANNEL"));
  if (objc_msgSend(v10, "peerSecondaryPreferredChannel"))
  {
    v25 = (unsigned __int16)objc_msgSend(v10, "peerSecondaryPreferredChannel");
    objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v25, 2), CFSTR("AWDL_INFO_EXT"));
  }
  if (objc_msgSend(v10, "peerAssistedDiscoveryMetric"))
    objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "peerAssistedDiscoveryMetric")), CFSTR("AWDL_INFO_ASSISTED_DISCOVERY_METRIC"));
  if (objc_msgSend(v10, "peerSupportedChannelFlags"))
    objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "peerSupportedChannelFlags")), CFSTR("AWDL_INFO_SUPPORTED_CHANNEL_FLAGS"));
  v17 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (objc_msgSend(v10, "localMasterChannel"))
    objc_msgSend(v17, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "localMasterChannel")), CFSTR("AWDL_INFO_PEER_MASTER_CHANNEL"));
  if (objc_msgSend(v10, "localPreferredChannel"))
    objc_msgSend(v17, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "localPreferredChannel")), CFSTR("AWDL_INFO_PREFERRED_CHANNEL"));
  if (objc_msgSend(v10, "localSecondaryPreferredChannel"))
  {
    v25 = (unsigned __int16)objc_msgSend(v10, "localSecondaryPreferredChannel");
    objc_msgSend(v17, "setObject:forKeyedSubscript:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v25, 2), CFSTR("AWDL_INFO_EXT"));
  }
  if (objc_msgSend(v10, "localAssistedDiscoveryMetric"))
    objc_msgSend(v17, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "localAssistedDiscoveryMetric")), CFSTR("AWDL_INFO_ASSISTED_DISCOVERY_METRIC"));
  if (objc_msgSend(v17, "count"))
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("AWDL_INFO_SELF"));
  if (objc_msgSend(v10, "followMode"))
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("APPLE80211KEY_AWDL_INFO_ASSISTED_DISCOVERY_FOLLOW"));
    if (objc_msgSend(v10, "followModePreferredBand"))
      objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "followModePreferredBand")), CFSTR("AWDL_INFO_PEER_PREFERRED_BAND"));
  }
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_10014AD28;
  aBlock[3] = &unk_100232430;
  aBlock[4] = self;
  aBlock[5] = v12;
  aBlock[6] = a4;
  aBlock[7] = a3;
  v18 = _Block_copy(aBlock);
  v19 = sub_10010F0C0(v14, v12, 4, v15, (uint64_t)sub_10014ADF4, (uint64_t)v18, objc_msgSend(a4, "processName"));
  if (v19)
  {
    v20 = (NSErrorDomain)CWFManagerErrorDomain;
    v21 = v19;
LABEL_37:
    v22 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v20, v21, 0);
    if (v22)
    {
      if (objc_msgSend(a3, "response"))
      {
        v23 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
        v23[2](v23, v22, 0);
      }

    }
  }
}

- (void)__stopAWDLPeerAssistedDiscovery:(id)a3 XPCConnection:(id)a4
{
  id v7;
  id v8;
  const void *v9;
  __WiFiDeviceManager *v10;
  uint64_t v11;
  id v12;
  _WORD *v13;
  void *v14;
  void *v15;
  int v16;
  NSError *v17;
  void (**v18)(id, NSError *, _QWORD);
  NSErrorDomain v19;
  uint64_t v20;
  _QWORD v21[8];

  v7 = a3;
  v8 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (!v8)
  {
    v19 = NSPOSIXErrorDomain;
    v20 = 22;
    goto LABEL_16;
  }
  v9 = v8;
  v10 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v8);
  if (!v10)
  {
    v19 = NSPOSIXErrorDomain;
    v20 = 6;
    goto LABEL_16;
  }
  v11 = (uint64_t)v10;
  v12 = objc_msgSend(-[WiFiXPCManager __peerAssistedDiscoveryNetworksForUUID:](self, "__peerAssistedDiscoveryNetworksForUUID:", objc_msgSend(a4, "UUID")), "objectForKeyedSubscript:", v9);
  if (!v12)
  {
    v19 = NSPOSIXErrorDomain;
    v20 = 2;
    goto LABEL_16;
  }
  v13 = sub_10002B314((uint64_t)kCFAllocatorDefault, v12);
  if (!v13)
  {
    v19 = NSPOSIXErrorDomain;
    v20 = 12;
LABEL_16:
    v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, v20, 0);
    if (!v17)
      return;
    goto LABEL_8;
  }
  v14 = v13;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10014B058;
  v21[3] = &unk_100232458;
  v21[4] = self;
  v21[5] = v9;
  v21[6] = a4;
  v21[7] = a3;
  v15 = _Block_copy(v21);
  v16 = sub_10010FABC(v11, v9, v14, (uint64_t)sub_10014B100, (uint64_t)v15);
  if (v16)
    v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CWFManagerErrorDomain, v16, 0);
  else
    v17 = 0;
  CFRelease(v14);
  if (v17)
  {
LABEL_8:
    if (objc_msgSend(a3, "response"))
    {
      v18 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
      v18[2](v18, v17, 0);
    }

  }
}

- (void)__addKnownNetworkProfile:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  __WiFiDeviceManager *v11;
  uint64_t v12;
  _WORD *v13;
  const void *v14;
  const __CFArray *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  const __CFArray *v22;
  const __CFArray *v23;
  id v24;
  unsigned int v25;
  NSError *v26;
  NSErrorDomain v27;
  uint64_t v28;
  id v29;
  id v30;
  const __CFArray *v31;
  void (**v32)(id, NSError *, _QWORD);
  NSErrorDomain v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v5 = a3;
  v6 = objc_msgSend(a3, "info");
  objc_msgSend(objc_msgSend(objc_msgSend(v6, "objectForKeyedSubscript:", CWFXPCNetworkProfilePropertiesKey), "mutableCopy"), "addObjectsFromArray:", &off_100254100);
  v7 = objc_msgSend(a3, "info");
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", CWFXPCNetworkProfileKey);
  if (!v8)
    goto LABEL_29;
  v9 = v8;
  v10 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (!v10)
    goto LABEL_29;
  v11 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v10);
  if (!v11)
  {
    v33 = NSPOSIXErrorDomain;
    v34 = 6;
LABEL_31:
    v26 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v33, v34, 0);
    if (!v26)
      return;
    goto LABEL_25;
  }
  v12 = (uint64_t)v11;
  v13 = sub_1000CCB10(v9, 0);
  if (!v13)
  {
LABEL_29:
    v33 = NSPOSIXErrorDomain;
    v34 = 22;
    goto LABEL_31;
  }
  v14 = v13;
  v15 = sub_100103568(v12, v13);
  if (v15)
  {
    v23 = v15;
    v27 = NSPOSIXErrorDomain;
    v28 = 17;
    goto LABEL_36;
  }
  v16 = objc_msgSend(v9, "copy");
  objc_msgSend(v16, "setOSSpecificAttributes:", 0);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = objc_msgSend(objc_msgSend(v9, "OSSpecificAttributes", 0), "allKeys");
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(v16, "setOSSpecificValue:forKey:", objc_msgSend(objc_msgSend(v9, "OSSpecificAttributes"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i)), *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v19);
  }
  v22 = (const __CFArray *)sub_1000CCB10(v16, 0);
  if (v22)
  {
    v23 = v22;
    if (((unint64_t)objc_msgSend(v9, "addReason") & 0xFFFFFFFFFFFFFFFELL) == 0xE)
    {
      v24 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      objc_msgSend(v24, "setObject:forKeyedSubscript:", sub_10002BE64((uint64_t)v23, CFSTR("NetworkOriginator")), CFSTR("NetworkOriginator"));
      objc_msgSend(v24, "setObject:forKeyedSubscript:", sub_10002BE64((uint64_t)v23, CFSTR("BundleIdentifier")), CFSTR("BundleIdentifier"));
      if (objc_msgSend(v16, "isSessionBased"))
        objc_msgSend(v24, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("DisassociateOnSessionEnd"));
      v25 = sub_100097414((uint64_t)self->_managerRef, 0, v23, (const __CFDictionary *)v24, (void (*)(uint64_t, const void *, uint64_t, uint64_t))sub_10014B580, (uint64_t)a3);
      v26 = 0;
      if (!v25)
        goto LABEL_23;
      v27 = (NSErrorDomain)CWFManagerErrorDomain;
      v28 = v25;
    }
    else
    {
      v29 = objc_msgSend((id)sub_10002BE64((uint64_t)v23, CFSTR("WiFiManagerKnownNetworksEventType")), "intValue");
      if (sub_100094420((uint64_t)self->_managerRef, v23, (uint64_t)v29))
      {
        if (objc_msgSend(a3, "response"))
        {
          v30 = objc_msgSend(a3, "response");
          (*((void (**)(id, _QWORD, _QWORD))v30 + 2))(v30, 0, 0);
        }

        v26 = 0;
        goto LABEL_23;
      }
      v27 = NSPOSIXErrorDomain;
      v28 = 6;
    }
LABEL_36:
    v26 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v27, v28, 0);
LABEL_23:
    CFRelease(v14);
    v31 = v23;
    goto LABEL_24;
  }
  v26 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0);
  v31 = (const __CFArray *)v14;
LABEL_24:
  CFRelease(v31);
  if (!v26)
    return;
LABEL_25:
  if (objc_msgSend(a3, "response"))
  {
    v32 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v32[2](v32, v26, 0);
  }

}

- (void)__updateKnownNetworkProfile:(id)a3 XPCConnection:(id)a4
{
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  const void *v13;
  __WiFiDeviceManager *v14;
  uint64_t v15;
  _WORD *v16;
  const void *v17;
  CFDictionaryRef *v18;
  CFDictionaryRef *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  _WORD *v29;
  unsigned int v30;
  const void *v31;
  void *v32;
  const void *v33;
  const void *v34;
  const void *v35;
  NSError *v36;
  const void *v37;
  void (**v38)(id, NSError *, _QWORD);
  NSErrorDomain v39;
  uint64_t v40;
  id v41;
  const void *v42;
  id v43;
  CFDictionaryRef *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v5 = a3;
  v7 = objc_msgSend(a3, "info");
  v8 = objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", CWFXPCNetworkProfilePropertiesKey), "mutableCopy");
  objc_msgSend(v8, "addObjectsFromArray:", &off_100254118);
  v9 = objc_msgSend(v5, "info");
  v10 = objc_msgSend(v9, "objectForKeyedSubscript:", CWFXPCNetworkProfileKey);
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(objc_msgSend(v5, "requestParameters"), "interfaceName");
    if (v12)
    {
      v13 = v12;
      v14 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v12);
      if (!v14)
      {
        v39 = NSPOSIXErrorDomain;
        v40 = 6;
        goto LABEL_34;
      }
      v15 = (uint64_t)v14;
      v16 = sub_1000CCB10(v11, 0);
      if (v16)
      {
        v17 = v16;
        v18 = (CFDictionaryRef *)sub_100103A48(v15, v16);
        if (!v18)
        {
          v36 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0);
          v37 = v17;
LABEL_27:
          CFRelease(v37);
          goto LABEL_28;
        }
        v19 = v18;
        v20 = sub_100026664(v18);
        if (v20)
        {
          v21 = v20;
          v41 = a4;
          v42 = v17;
          v43 = v5;
          v44 = v19;
          v22 = objc_msgSend(v5, "info");
          v23 = objc_msgSend(v11, "filteredNetworkProfileWithProperties:OSSpecificKeys:", v8, objc_msgSend(v22, "objectForKeyedSubscript:", CWFXPCOSSpecificKeysKey));
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v24 = objc_msgSend(objc_msgSend(v23, "OSSpecificAttributes"), "allKeys");
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(_QWORD *)v46 != v27)
                  objc_enumerationMutation(v24);
                objc_msgSend(v21, "setOSSpecificValue:forKey:", objc_msgSend(objc_msgSend(v23, "OSSpecificAttributes"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i)), *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i));
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
            }
            while (v26);
          }
          objc_msgSend(v23, "setOSSpecificAttributes:", 0);
          objc_msgSend(v21, "mergeWithNetworkProfile:", v23);
          v29 = sub_1000CCB10(v21, 0);
          if (v29)
          {
            v19 = v44;
            if ((sub_10009B2F4((uint64_t)self->_managerRef, v29, objc_msgSend(v41, "processName")) & 1) != 0
              && sub_100099EA4((uint64_t)self->_managerRef, v29, 1u))
            {
              v30 = objc_msgSend(v21, "disable6EMode") == (id)2;
              v31 = sub_10002B088(v29);
              sub_10010A4F8(v15, v13, v31, v30);
              v32 = sub_1000169FC(v15, v13);
              if (v32)
              {
                v33 = v32;
                v34 = sub_10002B088(v32);
                v35 = sub_10002B088(v29);
                v17 = v42;
                v5 = v43;
                if (v34 && v35 && CFEqual(v34, v35))
                  sub_10010552C(v15, (const __CFDictionary **)v29);
                CFRelease(v33);
                v36 = 0;
                goto LABEL_25;
              }
              v36 = 0;
            }
            else
            {
              v36 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 6, 0);
            }
            v17 = v42;
            v5 = v43;
          }
          else
          {
            v36 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0);
            v5 = v43;
            v19 = v44;
          }
        }
        else
        {
          v36 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0);
          v29 = 0;
        }
LABEL_25:
        CFRelease(v17);
        CFRelease(v19);
        if (!v29)
          goto LABEL_28;
        v37 = v29;
        goto LABEL_27;
      }
    }
  }
  v39 = NSPOSIXErrorDomain;
  v40 = 22;
LABEL_34:
  v36 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v39, v40, 0);
LABEL_28:
  if (objc_msgSend(v5, "response"))
  {
    v38 = (void (**)(id, NSError *, _QWORD))objc_msgSend(v5, "response");
    v38[2](v38, v36, 0);
  }
}

- (void)__removeKnownNetworkProfile:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  __WiFiDeviceManager *v12;
  uint64_t v13;
  _WORD *v14;
  void *v15;
  const __CFArray *v16;
  const __CFDictionary **v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  const void *v26;
  NSError *v27;
  const __CFDictionary **v28;
  void (**v29)(id, NSError *, _QWORD);
  NSErrorDomain v30;
  uint64_t v31;
  int v32;
  const char *v33;
  __int16 v34;
  const void *v35;
  __int16 v36;
  id v37;

  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCNetworkProfileKey);
  if (!v6)
    goto LABEL_38;
  v7 = v6;
  v8 = objc_msgSend(a3, "info");
  v9 = objc_msgSend(v8, "objectForKeyedSubscript:", CWFXPCRemoveReasonKey);
  if (!v9)
    goto LABEL_38;
  v10 = v9;
  v11 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (!v11)
    goto LABEL_38;
  v12 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
  if (!v12)
  {
    v30 = NSPOSIXErrorDomain;
    v31 = 6;
    goto LABEL_39;
  }
  v13 = (uint64_t)v12;
  v14 = sub_1000CCB10(v7, 0);
  if (!v14)
  {
LABEL_38:
    v30 = NSPOSIXErrorDomain;
    v31 = 22;
LABEL_39:
    v27 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v30, v31, 0);
    goto LABEL_35;
  }
  v15 = v14;
  v16 = sub_100103568(v13, v14);
  if (v16)
  {
    v17 = (const __CFDictionary **)v16;
    v18 = objc_msgSend(v10, "integerValue");
    v19 = 0;
    v20 = 4;
    switch((unint64_t)v18)
    {
      case 2uLL:
      case 3uLL:
        v19 = 1;
        goto LABEL_10;
      case 4uLL:
        break;
      case 6uLL:
        v19 = 0;
        v20 = 7;
        break;
      case 7uLL:
        v19 = 0;
        v20 = 12;
        break;
      case 8uLL:
        v19 = 0;
        v20 = 13;
        break;
      default:
        v19 = 0;
LABEL_10:
        v20 = 2;
        break;
    }
    if (sub_100098DBC((uint64_t)self->_managerRef, v17, (const void *)v20))
    {
      sub_1001035D0(v13, v17);
      if (v19)
      {
        if (((uint64_t (*)(void))CWFGetOSLog)())
          v22 = ((uint64_t (*)(void))CWFGetOSLog)();
        else
          v22 = &_os_log_default;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v32 = 136315650;
          v33 = "-[WiFiXPCManager __removeKnownNetworkProfile:]";
          v34 = 2112;
          v35 = sub_10002B088(v17);
          v36 = 2048;
          v37 = objc_msgSend(v10, "integerValue");
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 1, "[corewifi] %s: Removing password for %@ per reason %ld", &v32, 32);
        }
        v21 = sub_1000C65D8(v17);
      }
      v23 = CWFGetOSLog(v21);
      if (v23)
        v24 = CWFGetOSLog(v23);
      else
        v24 = &_os_log_default;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = "false";
        if (!&_EAPTLSRemoveTrustExceptionsBindings)
          v25 = "true";
        v32 = 136315138;
        v33 = v25;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v24, 1, "[corewifi] EAPTLSRemoveTrustExceptionsBindings is NULL = %s", (const char *)&v32);
      }
      if (&_EAPTLSRemoveTrustExceptionsBindings && sub_10002DAB4((uint64_t)v17))
      {
        v26 = sub_10002B088(v17);
        EAPTLSRemoveTrustExceptionsBindings(CFSTR("WirelessSSID"), v26);
      }
      v27 = 0;
    }
    else
    {
      v27 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 6, 0);
    }
    CFRelease(v15);
    v28 = v17;
  }
  else
  {
    v27 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0);
    v28 = (const __CFDictionary **)v15;
  }
  CFRelease(v28);
LABEL_35:
  if (objc_msgSend(a3, "response"))
  {
    v29 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v29[2](v29, v27, 0);
  }
}

- (void)__addKnownBSS:(id)a3
{
  id v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  __WiFiDeviceManager *v12;
  uint64_t v13;
  _WORD *v14;
  const void *v15;
  CFDictionaryRef *v16;
  CFDictionaryRef *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  _WORD *v26;
  NSError *v27;
  const void *v28;
  void (**v29)(id, NSError *, _QWORD);
  NSErrorDomain v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  WiFiXPCManager *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v3 = a3;
  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCNetworkProfileKey);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v3, "info");
    v9 = objc_msgSend(v8, "objectForKeyedSubscript:", CWFXPCBSSKey);
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend(objc_msgSend(v3, "requestParameters"), "interfaceName");
      if (v11)
      {
        v12 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
        if (!v12)
        {
          v30 = NSPOSIXErrorDomain;
          v31 = 6;
          goto LABEL_26;
        }
        v13 = (uint64_t)v12;
        v14 = sub_1000CCB10(v7, 0);
        if (v14)
        {
          v15 = v14;
          v16 = (CFDictionaryRef *)sub_100103A48(v13, v14);
          if (!v16)
          {
            v27 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0);
            v28 = v15;
LABEL_21:
            CFRelease(v28);
            goto LABEL_22;
          }
          v17 = v16;
          v18 = sub_100026664(v16);
          if (v18)
          {
            v19 = v18;
            if (!objc_msgSend(v18, "matchingKnownBSS:", v10))
            {
              v34 = self;
              v35 = v3;
              v20 = objc_msgSend(v10, "copy");
              objc_msgSend(v20, "setOSSpecificAttributes:", 0);
              v38 = 0u;
              v39 = 0u;
              v36 = 0u;
              v37 = 0u;
              v21 = objc_msgSend(objc_msgSend(v10, "OSSpecificAttributes"), "allKeys");
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v37;
                do
                {
                  for (i = 0; i != v23; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v37 != v24)
                      objc_enumerationMutation(v21);
                    objc_msgSend(v20, "setOSSpecificValue:forKey:", objc_msgSend(objc_msgSend(v10, "OSSpecificAttributes"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i)), *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i));
                  }
                  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
                }
                while (v23);
              }
              objc_msgSend(v19, "setBSSList:", objc_msgSend(objc_msgSend(v19, "BSSList"), "setByAddingObject:", v20));
              v26 = sub_1000CCB10(v19, 0);
              if (v26)
              {
                v3 = v35;
                if (sub_100099EA4((uint64_t)v34->_managerRef, v26, 1u))
                {
                  v27 = 0;
LABEL_19:
                  CFRelease(v15);
                  CFRelease(v17);
                  if (!v26)
                    goto LABEL_22;
                  v28 = v26;
                  goto LABEL_21;
                }
                v33 = 6;
              }
              else
              {
                v33 = 22;
                v3 = v35;
              }
              v27 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v33, 0);
              goto LABEL_19;
            }
            v32 = 17;
          }
          else
          {
            v32 = 2;
          }
          v27 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v32, 0);
          v26 = 0;
          goto LABEL_19;
        }
      }
    }
  }
  v30 = NSPOSIXErrorDomain;
  v31 = 22;
LABEL_26:
  v27 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v30, v31, 0);
LABEL_22:
  if (objc_msgSend(v3, "response"))
  {
    v29 = (void (**)(id, NSError *, _QWORD))objc_msgSend(v3, "response");
    v29[2](v29, v27, 0);
  }
}

- (void)__updateKnownBSS:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  __WiFiDeviceManager *v12;
  uint64_t v13;
  _WORD *v14;
  const void *v15;
  CFDictionaryRef *v16;
  CFDictionaryRef *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  _WORD *v31;
  NSError *v32;
  const void *v33;
  void (**v34)(id, NSError *, _QWORD);
  NSErrorDomain v35;
  uint64_t v36;
  uint64_t v37;
  WiFiXPCManager *v38;
  CFTypeRef cf;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCNetworkProfileKey);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(a3, "info");
    v9 = objc_msgSend(v8, "objectForKeyedSubscript:", CWFXPCBSSKey);
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
      if (v11)
      {
        v12 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
        if (!v12)
        {
          v35 = NSPOSIXErrorDomain;
          v36 = 6;
          goto LABEL_26;
        }
        v13 = (uint64_t)v12;
        v14 = sub_1000CCB10(v7, 0);
        if (v14)
        {
          v15 = v14;
          v16 = (CFDictionaryRef *)sub_100103A48(v13, v14);
          if (!v16)
          {
            v32 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0);
            v33 = v15;
LABEL_21:
            CFRelease(v33);
            goto LABEL_22;
          }
          v17 = v16;
          v18 = sub_100026664(v16);
          if (v18)
          {
            v19 = v18;
            v20 = objc_msgSend(v18, "matchingKnownBSS:", v10);
            if (v20)
            {
              v21 = v20;
              v38 = self;
              cf = v15;
              v22 = objc_msgSend(a3, "info");
              v23 = objc_msgSend(v22, "objectForKeyedSubscript:", CWFXPCBSSPropertiesKey);
              v24 = objc_msgSend(a3, "info");
              v25 = objc_msgSend(v10, "filteredBSSWithProperties:OSSpecificKeys:", v23, objc_msgSend(v24, "objectForKeyedSubscript:", CWFXPCOSSpecificKeysKey));
              v40 = 0u;
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v26 = objc_msgSend(objc_msgSend(v25, "OSSpecificAttributes"), "allKeys");
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v41;
                do
                {
                  for (i = 0; i != v28; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v41 != v29)
                      objc_enumerationMutation(v26);
                    objc_msgSend(v21, "setOSSpecificValue:forKey:", objc_msgSend(objc_msgSend(v25, "OSSpecificAttributes"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i)), *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i));
                  }
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
                }
                while (v28);
              }
              objc_msgSend(v25, "setOSSpecificAttributes:", 0);
              objc_msgSend(v21, "mergeWithBSS:", v25);
              v31 = sub_1000CCB10(v19, 0);
              if (v31)
              {
                v15 = cf;
                if (sub_100099EA4((uint64_t)v38->_managerRef, v31, 1u))
                {
                  v32 = 0;
LABEL_19:
                  CFRelease(v15);
                  CFRelease(v17);
                  if (!v31)
                    goto LABEL_22;
                  v33 = v31;
                  goto LABEL_21;
                }
                v37 = 6;
              }
              else
              {
                v37 = 22;
                v15 = cf;
              }
              v32 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v37, 0);
              goto LABEL_19;
            }
          }
          v32 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0);
          v31 = 0;
          goto LABEL_19;
        }
      }
    }
  }
  v35 = NSPOSIXErrorDomain;
  v36 = 22;
LABEL_26:
  v32 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v35, v36, 0);
LABEL_22:
  if (objc_msgSend(a3, "response"))
  {
    v34 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v34[2](v34, v32, 0);
  }
}

- (void)__removeKnownBSS:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  __WiFiDeviceManager *v12;
  uint64_t v13;
  _WORD *v14;
  const void *v15;
  CFDictionaryRef *v16;
  CFDictionaryRef *v17;
  void *v18;
  void *v19;
  _WORD *v20;
  id v21;
  NSError *v22;
  const void *v23;
  void (**v24)(id, NSError *, _QWORD);
  NSErrorDomain v25;
  uint64_t v26;
  uint64_t v27;

  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCNetworkProfileKey);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(a3, "info");
    v9 = objc_msgSend(v8, "objectForKeyedSubscript:", CWFXPCBSSKey);
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
      if (v11)
      {
        v12 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
        if (!v12)
        {
          v25 = NSPOSIXErrorDomain;
          v26 = 6;
          goto LABEL_20;
        }
        v13 = (uint64_t)v12;
        v14 = sub_1000CCB10(v7, 0);
        if (v14)
        {
          v15 = v14;
          v16 = (CFDictionaryRef *)sub_100103A48(v13, v14);
          if (!v16)
          {
            v22 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0);
            v23 = v15;
LABEL_14:
            CFRelease(v23);
            goto LABEL_15;
          }
          v17 = v16;
          v18 = sub_100026664(v16);
          if (v18)
          {
            v19 = v18;
            v20 = objc_msgSend(v18, "matchingKnownBSS:", v10);
            if (v20)
            {
              v21 = objc_msgSend(objc_msgSend(v19, "BSSList"), "mutableCopy");
              objc_msgSend(v21, "removeObject:", v20);
              objc_msgSend(v19, "setBSSList:", v21);
              v20 = sub_1000CCB10(v19, 0);
              if (v20)
              {
                if (sub_100099EA4((uint64_t)self->_managerRef, v20, 1u))
                {
                  v22 = 0;
LABEL_12:
                  CFRelease(v15);
                  CFRelease(v17);
                  if (!v20)
                    goto LABEL_15;
                  v23 = v20;
                  goto LABEL_14;
                }
                v27 = 6;
              }
              else
              {
                v27 = 22;
              }
LABEL_26:
              v22 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v27, 0);
              goto LABEL_12;
            }
          }
          else
          {
            v20 = 0;
          }
          v27 = 2;
          goto LABEL_26;
        }
      }
    }
  }
  v25 = NSPOSIXErrorDomain;
  v26 = 22;
LABEL_20:
  v22 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v25, v26, 0);
LABEL_15:
  if (objc_msgSend(a3, "response"))
  {
    v24 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v24[2](v24, v22, 0);
  }
}

- (void)__setPower:(id)a3 XPCConnection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSError *v11;
  void (**v12)(id, NSError *, _QWORD);
  NSErrorDomain v13;
  uint64_t v14;

  v7 = objc_msgSend(a3, "info");
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", CWFXPCPowerKey);
  if (v8 && (v9 = v8, (v10 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) != 0))
  {
    if (-[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v10))
    {
      sub_100093358((uint64_t)self->_managerRef, (int)objc_msgSend(v9, "BOOLValue"), (const __CFString *)objc_msgSend(a4, "processName"));
      v11 = 0;
      goto LABEL_5;
    }
    v13 = NSPOSIXErrorDomain;
    v14 = 6;
  }
  else
  {
    v13 = NSPOSIXErrorDomain;
    v14 = 22;
  }
  v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, v14, 0);
LABEL_5:
  if (objc_msgSend(a3, "response"))
  {
    v12 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v12[2](v12, v11, 0);
  }
}

- (void)__getPassword:(id)a3
{
  id v4;
  id v5;
  CFDictionaryRef *v6;
  CFDictionaryRef *v7;
  CFStringRef v8;
  __CFString *v9;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  NSError *v13;
  void (**v14)(id, NSError *, _QWORD);

  v4 = objc_msgSend(a3, "info");
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", CWFXPCNetworkProfileKey);
  if (v5 && (v6 = (CFDictionaryRef *)sub_1000CCB10(v5, 0)) != 0)
  {
    v7 = v6;
    v8 = sub_1000C37A0(v6);
    if (v8)
    {
      v9 = (__CFString *)v8;
      v10 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      v11 = -[__CFString copy](v9, "copy");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CWFXPCResultKey);
      if (objc_msgSend(a3, "response"))
      {
        v12 = (void (**)(id, _QWORD, id))objc_msgSend(a3, "response");
        v12[2](v12, 0, v10);
      }
      CFRelease(v7);
      CFRelease(v9);
      return;
    }
    v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0);
    CFRelease(v7);
  }
  else
  {
    v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0);
  }
  if (v13 && objc_msgSend(a3, "response"))
  {
    v14 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v14[2](v14, v13, 0);
  }
}

- (void)__setPassword:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  const __CFString *v8;
  _WORD *v9;
  const void *v10;
  NSError *v11;
  void (**v12)(id, NSError *, _QWORD);

  v4 = objc_msgSend(a3, "info");
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", CWFXPCNetworkProfileKey);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(a3, "info");
    v8 = (const __CFString *)objc_msgSend(v7, "objectForKeyedSubscript:", CWFXPCPasswordKey);
    v9 = sub_1000CCB10(v6, 0);
    if (v9)
    {
      v10 = v9;
      if (v8)
      {
        if (sub_1000C64F0(v9, v8))
        {
LABEL_5:
          v11 = 0;
LABEL_6:
          CFRelease(v10);
          goto LABEL_7;
        }
      }
      else if (sub_1000C65D8(v9))
      {
        goto LABEL_5;
      }
      v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 6, 0);
      goto LABEL_6;
    }
  }
  v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0);
LABEL_7:
  if (objc_msgSend(a3, "response"))
  {
    v12 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v12[2](v12, v11, 0);
  }
}

- (void)__disassociate:(id)a3 XPCConnection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  const void *v11;
  __WiFiDeviceManager *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSError *v18;
  void (**v19)(id, NSError *, _QWORD);
  NSErrorDomain v20;
  uint64_t v21;
  int v22;
  id v23;

  v7 = objc_msgSend(a3, "info");
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", CWFXPCDisassocReasonKey);
  if (!v8 || (v9 = v8, (v10 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    v20 = NSPOSIXErrorDomain;
    v21 = 22;
LABEL_22:
    v18 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v20, v21, 0);
    goto LABEL_17;
  }
  v11 = v10;
  v12 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v10);
  if (!v12)
  {
    v20 = NSPOSIXErrorDomain;
    v21 = 6;
    goto LABEL_22;
  }
  v13 = (uint64_t)v12;
  v14 = objc_msgSend(v9, "integerValue");
  switch((unint64_t)v14)
  {
    case 1uLL:
      v15 = 1033;
      break;
    case 2uLL:
    case 5uLL:
    case 6uLL:
      sub_10009FDA0((const __CFArray *)objc_msgSend(+[WiFiXPCManager sharedXPCManager](WiFiXPCManager, "sharedXPCManager"), "getWiFiManager"), objc_msgSend(a4, "processName"));
      v15 = 1011;
      break;
    case 3uLL:
      v15 = 1015;
      break;
    case 4uLL:
      v15 = 1012;
      break;
    case 7uLL:
      v15 = 1027;
      break;
    default:
      v15 = 1001;
      break;
  }
  v16 = CWFGetOSLog(v14);
  if (v16)
    v17 = CWFGetOSLog(v16);
  else
    v17 = &_os_log_default;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 134217984;
    v23 = objc_msgSend(v9, "integerValue");
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[corewifi] __disassociate Request from CoreWiFi with reason:%ld \n", &v22);
  }
  sub_1000F7F48(v13, v11, v15, "-[WiFiXPCManager __disassociate:XPCConnection:]", 1461);
  v18 = 0;
LABEL_17:
  if (objc_msgSend(a3, "response"))
  {
    v19 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v19[2](v19, v18, 0);
  }
}

- (void)__updateSoftAPBand:(id)a3 XPCConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  __WiFiDeviceManager *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  NSError *v20;
  void (**v21)(id, NSError *, _QWORD);
  NSErrorDomain v22;
  uint64_t v23;
  _BYTE v24[24];

  v6 = objc_msgSend(a3, "info");
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", CWFXPCSoftAPBand);
  if (!v7 || (v8 = v7, (v9 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    v22 = NSPOSIXErrorDomain;
    v23 = 22;
LABEL_30:
    v20 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, v23, 0);
    goto LABEL_25;
  }
  v10 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v9);
  if (!v10)
  {
    v22 = NSPOSIXErrorDomain;
    v23 = 6;
    goto LABEL_30;
  }
  v11 = (uint64_t)v10;
  v12 = objc_msgSend(v8, "integerValue");
  if (v12 == (id)2)
  {
    v15 = CWFGetOSLog(2);
    if (v15)
      v16 = CWFGetOSLog(v15);
    else
      v16 = &_os_log_default;
    v19 = 2;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[corewifi] __updateSoftAPBand Request to 5G from CoreWiFi\n", v24, 2, *(_QWORD *)v24);
    }
  }
  else if (v12 == (id)1)
  {
    v13 = CWFGetOSLog(1);
    if (v13)
      v14 = CWFGetOSLog(v13);
    else
      v14 = &_os_log_default;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      v19 = 1;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[corewifi] __updateSoftAPBand Request to 2.4G from CoreWiFi\n", v24, 2, *(_QWORD *)v24);
    }
    else
    {
      v19 = 1;
    }
  }
  else
  {
    v17 = CWFGetOSLog(v12);
    if (v17)
      v18 = CWFGetOSLog(v17);
    else
      v18 = &_os_log_default;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 134217984;
      *(_QWORD *)&v24[4] = objc_msgSend(v8, "integerValue");
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[corewifi] __updateSoftAPBand Request with unexpected band(%ld)\n", v24);
    }
    v19 = 2;
  }
  sub_100103CA0(v11, v19);
  v20 = 0;
LABEL_25:
  if (objc_msgSend(a3, "response"))
  {
    v21 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v21[2](v21, v20, 0);
  }
}

- (void)__associate:(id)a3 XPCConnection:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _WORD *v14;
  _WORD *v15;
  id v16;
  const void *v17;
  __WiFiDeviceManager *v18;
  uint64_t v19;
  CFDictionaryRef *v20;
  CFDictionaryRef *v21;
  id v22;
  _WORD *v23;
  const void *v24;
  CFDictionaryRef v25;
  CFDictionaryRef v26;
  id v27;
  id v28;
  unsigned int v29;
  id v30;
  int v31;
  NSError *v32;
  void (**v33)(id, NSError *, _QWORD);
  NSErrorDomain v34;
  uint64_t v35;
  id v36;
  _WORD v37[8];

  v7 = CWFGetOSLog(a3);
  if (v7)
    v8 = CWFGetOSLog(v7);
  else
    v8 = &_os_log_default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v37[0] = 0;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[corewifi] __associate Manual Association Requestion from user \n", v37, 2);
  }
  v9 = objc_msgSend(a3, "info");
  v10 = objc_msgSend(v9, "objectForKeyedSubscript:", CWFXPCAssocParamsKey);
  if (!v10)
    goto LABEL_45;
  v11 = v10;
  v12 = objc_msgSend(objc_msgSend(v10, "scanResult"), "scanRecord");
  if (!v12)
    goto LABEL_45;
  v13 = v12;
  v14 = sub_10002B314((uint64_t)kCFAllocatorDefault, v12);
  if (!v14)
    goto LABEL_45;
  v15 = v14;
  v16 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (!v16)
  {
    v34 = NSPOSIXErrorDomain;
    v35 = 22;
    goto LABEL_50;
  }
  v17 = v16;
  v18 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v16);
  if (!v18)
  {
    v34 = NSPOSIXErrorDomain;
    v35 = 6;
    goto LABEL_50;
  }
  v19 = (uint64_t)v18;
  v36 = a4;
  v20 = (CFDictionaryRef *)sub_100103568((uint64_t)v18, v15);
  if (v20)
  {
    v21 = v20;
    v22 = sub_100026664(v20);
    if (objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "hiddenState"))
      objc_msgSend(v22, "setHiddenState:", objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "hiddenState"));
    if (objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "EAPProfile"))
      objc_msgSend(v22, "setEAPProfile:", objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "EAPProfile"));
    CFRelease(v21);
    if (!v22)
      goto LABEL_23;
  }
  else
  {
    v22 = objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "copy");
    if (!v22)
      goto LABEL_23;
  }
  objc_msgSend(v22, "setSSID:", objc_msgSend(objc_msgSend(v11, "scanResult"), "SSID"));
  objc_msgSend(v22, "setPublicAirPlayNetwork:", objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "isPublicAirPlayNetwork"));
  v23 = sub_1000CCB10(v22, objc_msgSend(v22, "properties"));
  if (v23)
  {
    v24 = v23;
    v25 = sub_1000173C0((uint64_t)v23);
    if (!v25)
      goto LABEL_22;
    v26 = v25;
    v27 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    objc_msgSend(v27, "addEntriesFromDictionary:", v26);
    objc_msgSend(v27, "addEntriesFromDictionary:", v13);
    v28 = objc_msgSend(v27, "copy");
    CFRelease(v15);
    v15 = sub_10002B314((uint64_t)kCFAllocatorDefault, v28);
    CFRelease(v26);
    if (v15)
    {
LABEL_22:
      CFRelease(v24);
      goto LABEL_23;
    }
LABEL_45:
    v32 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0);
    if (!v32)
      return;
    goto LABEL_41;
  }
LABEL_23:
  sub_10002C478((uint64_t)v15, CFSTR("enabled"), 0);
  sub_10002C478((uint64_t)v15, CFSTR("Standalone"), 0);
  if (objc_msgSend(v11, "forceBSSID"))
    sub_10002C478((uint64_t)v15, CFSTR("FORCE_BSSID"), kCFBooleanTrue);
  if (objc_msgSend(v11, "bandPreference"))
    sub_10002C478((uint64_t)v15, CFSTR("BAND_PREFERENCE"), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v11, "bandPreference")));
  if (objc_msgSend(v11, "colocatedScopeID"))
    sub_10002C478((uint64_t)v15, CFSTR("COLOCATED_NETWORK_SCOPE_ID"), objc_msgSend(v11, "colocatedScopeID"));
  if (objc_msgSend(v11, "has6GHzOnlyBSS"))
  {
    v29 = sub_100017A54((uint64_t)v15, CFSTR("ASSOC_FLAGS"));
    sub_10002B698((uint64_t)v15, CFSTR("ASSOC_FLAGS"), v29 | 0x100000);
  }
  if (!objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "addReason"))
  {
    sub_10002C478((uint64_t)v15, CFSTR("WiFiManagerKnownNetworksEventType"), &off_100253950);
    if (objc_msgSend(objc_msgSend(v36, "processName"), "isEqualToString:", CFSTR("Setup")))
      sub_1000CB1D4((uint64_t)v15, 4u);
  }
  v30 = objc_msgSend(objc_msgSend(v11, "EAPCredentials"), "password");
  if (!v30)
    v30 = objc_msgSend(v11, "password");
  if (objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "isPublicAirPlayNetwork"))
    sub_1000CFA18((uint64_t)v15, (int)objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "isPublicAirPlayNetwork"));
  sub_10011EB98((const __CFDictionary *)objc_msgSend(objc_msgSend(v11, "scanResult"), "scanRecord"), (const __CFDictionary *)v15);
  v31 = sub_10010AD4C(v19, v17, v15, v30, (const __CFString *)objc_msgSend(v36, "processName"), (uint64_t)sub_10014D438, (uint64_t)a3, 1008);
  if (!v31)
  {
    v32 = 0;
    goto LABEL_40;
  }
  v34 = (NSErrorDomain)CWFManagerErrorDomain;
  v35 = v31;
LABEL_50:
  v32 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v34, v35, 0);
LABEL_40:
  CFRelease(v15);
  if (!v32)
    return;
LABEL_41:
  if (objc_msgSend(a3, "response"))
  {
    v33 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v33[2](v33, v32, 0);
  }

}

+ (id)__filteredScanResults:(__CFArray *)a3 scanParameters:(id)a4
{
  id v6;
  CFIndex v7;
  void *v8;
  const void *ValueAtIndex;
  id v10;

  v6 = +[NSMutableArray array](NSMutableArray, "array");
  if (a3 && CFArrayGetCount(a3) >= 1)
  {
    v7 = 0;
    do
    {
      v8 = objc_autoreleasePoolPush();
      ValueAtIndex = CFArrayGetValueAtIndex(a3, v7);
      if (ValueAtIndex)
      {
        v10 = sub_100027D10((uint64_t)ValueAtIndex);
        if (v10)
          objc_msgSend(v6, "addObject:", v10);
      }
      objc_autoreleasePoolPop(v8);
      ++v7;
    }
    while (CFArrayGetCount(a3) > v7);
  }
  return (id)CWFFilteredScanResults(v6, a4);
}

- (void)__performScan:(id)a3 XPCConnection:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  __WiFiDeviceManager *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  NSNumber *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  uint64_t v29;
  NSNumber *v30;
  NSNumber *v31;
  int v32;
  NSErrorDomain v33;
  uint64_t v34;
  uint64_t v35;
  __CFArray *v36;
  __CFArray *v37;
  id v38;
  id v39;
  const void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  uint64_t v56;
  _BYTE v57[128];
  _QWORD v58[2];
  _QWORD v59[2];
  _BYTE v60[128];

  v7 = a3;
  v8 = objc_msgSend(a3, "info");
  v9 = objc_msgSend(v8, "objectForKeyedSubscript:", CWFXPCScanParamsKey);
  if (v9 && (v10 = v9, (v11 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) != 0))
  {
    v12 = v11;
    v13 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
    if (v13)
    {
      v42 = (uint64_t)v13;
      v14 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      if (objc_msgSend(v10, "SSID") || _os_feature_enabled_impl("CoreWiFi", "WiFi6EAlwaysFollowup"))
      {
        objc_msgSend(v10, "setScanFlags:", objc_msgSend(v10, "scanFlags") | 0x800);
        if (!objc_msgSend(a4, "processName")
          || (objc_msgSend(objc_msgSend(a4, "processName"), "isEqualToString:", CFSTR("locationd")) & 1) == 0
          && (objc_msgSend(objc_msgSend(a4, "processName"), "isEqualToString:", CFSTR("milod")) & 1) == 0)
        {
          objc_msgSend(v10, "setScanFlags:", objc_msgSend(v10, "scanFlags") | 0x100);
        }
      }
      v41 = v14;
      v44 = a4;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v43 = v10;
      v15 = objc_msgSend(v10, "channels", v12);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v19)
              objc_enumerationMutation(v15);
            v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
            if (!v18)
              v18 = +[NSMutableArray array](NSMutableArray, "array");
            v58[0] = CFSTR("CHANNEL");
            v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "channel"));
            v58[1] = CFSTR("CHANNEL_FLAGS");
            v59[0] = v22;
            v59[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v21, "flags"));
            objc_msgSend(v18, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 2));
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
        }
        while (v17);
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("SCAN_CHANNELS"));
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v23 = objc_msgSend(v10, "SSIDList");
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      if (v24)
      {
        v25 = v24;
        v26 = 0;
        v27 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(_QWORD *)v46 != v27)
              objc_enumerationMutation(v23);
            v29 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
            if (!v26)
              v26 = +[NSMutableArray array](NSMutableArray, "array");
            v55 = CFSTR("SSID_STR");
            v56 = v29;
            objc_msgSend(v26, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        }
        while (v25);
      }
      else
      {
        v26 = 0;
      }
      if (objc_msgSend(v26, "count"))
      {
        v53 = CFSTR("SSID_STR");
        v54 = &stru_100238178;
        objc_msgSend(v26, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
      }
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v26, CFSTR("SCAN_SSID_LIST"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", objc_msgSend(v43, "SSID"), CFSTR("SSID_STR"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v43, "scanType")), CFSTR("SCAN_TYPE"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v43, "BSSType")), CFSTR("SCAN_BSS_TYPE"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v43, "PHYMode")), CFSTR("SCAN_PHY_MODE"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v43, "restTime")), CFSTR("SCAN_REST_TIME"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v43, "dwellTime")), CFSTR("SCAN_DWELL_TIME"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v43, "mergeScanResults")), CFSTR("SCAN_MERGE"));
      if (objc_msgSend(v43, "numberOfScans"))
        v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v43, "numberOfScans"));
      else
        v30 = (NSNumber *)&off_100253950;
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v30, CFSTR("SCAN_NUM_SCANS"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v43, "scanFlags")), CFSTR("SCAN_FLAGS"));
      if (objc_msgSend(v43, "shortSSID"))
        v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v43, "shortSSID"));
      else
        v31 = 0;
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v31, CFSTR("SCAN_SHORT_SSID"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", objc_msgSend(v43, "BSSID"), CFSTR("BSSID"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v43, "minimumTimestamp")), CFSTR("SCAN_MIN_TIMESTAMP"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("SCAN_MERGE"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("SCAN_CLOSED_NETWORKS"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", objc_msgSend(v44, "processName"), CFSTR("ScanReqClientName"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(objc_msgSend(v44, "XPCConnection"), "processIdentifier")), CFSTR("ScanReqClientPid"));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", objc_msgSend(a3, "receivedAt"), CFSTR("ScanReqReceiptTimestamp"));
      if (objc_msgSend(v43, "acceptableCacheAge") == (id)-1)
      {
        v35 = sub_1000161D4(v42);
        if (v35 && (v36 = sub_1000775BC(v35, 0)) != 0)
        {
          v37 = v36;
          v38 = +[WiFiXPCManager __filteredScanResults:scanParameters:](WiFiXPCManager, "__filteredScanResults:scanParameters:", v36, v43);
          CFRelease(v37);
        }
        else
        {
          v38 = 0;
        }
        v39 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, CWFXPCResultKey);
        if (!objc_msgSend(a3, "response"))
          goto LABEL_49;
LABEL_48:
        (*((void (**)(void))objc_msgSend(a3, "response") + 2))();
LABEL_49:

        return;
      }
      objc_msgSend(v41, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v43, "acceptableCacheAge") / 1000.0), CFSTR("SCAN_MAXAGE"));
      v32 = sub_100017D98(v42, v40, (const __CFDictionary *)v41, (const __CFString *)objc_msgSend(v44, "processName"), (uint64_t)sub_10014E2F0, (uint64_t)a3);
      if (!v32)
        return;
      v33 = (NSErrorDomain)CWFManagerErrorDomain;
      v34 = v32;
    }
    else
    {
      v33 = NSPOSIXErrorDomain;
      v34 = 6;
    }
  }
  else
  {
    v33 = NSPOSIXErrorDomain;
    v34 = 22;
  }
  if (+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v33, v34, 0))
  {
    if (!objc_msgSend(a3, "response"))
      goto LABEL_49;
    goto LABEL_48;
  }
}

- (void)__performANQP:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  const void *v10;
  __WiFiDeviceManager *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  id v20;
  __CFArray *v21;
  __CFArray *v22;
  NSNumber *v23;
  const __CFString *v24;
  int v25;
  NSError *v26;
  void (**v27)(id, NSError *, _QWORD);
  NSErrorDomain v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v5 = a3;
  v6 = objc_msgSend(a3, "info");
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", CWFXPCANQPParamsKey);
  if (!v7 || (v8 = v7, (v9 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    v28 = NSPOSIXErrorDomain;
    v29 = 22;
    goto LABEL_27;
  }
  v10 = v9;
  v11 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v9);
  if (!v11)
  {
    v28 = NSPOSIXErrorDomain;
    v29 = 6;
    goto LABEL_27;
  }
  v12 = (uint64_t)v11;
  v13 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_100253968, CFSTR("GAS_PROTOCOL"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(v8, "ANQPElementIDList"), CFSTR("GAS_QUERY"));
  v14 = +[NSMutableArray array](NSMutableArray, "array");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = objc_msgSend(v8, "scanResults", 0);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "scanRecord");
        if (v20)
          objc_msgSend(v14, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v17);
  }
  v21 = sub_100064608((const __CFArray *)v14);
  if (!v21)
  {
    v28 = NSPOSIXErrorDomain;
    v29 = 12;
LABEL_27:
    v26 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v28, v29, 0);
    if (!v26)
      return;
    goto LABEL_20;
  }
  v22 = v21;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("GAS_NETWORKS"));
  if (objc_msgSend(v8, "acceptableCacheAge") == (id)-1)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_100253980, CFSTR("SCAN_MAXAGE"));
    v23 = (NSNumber *)&__kCFBooleanTrue;
    v24 = CFSTR("CacheOnly");
  }
  else
  {
    v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v8, "acceptableCacheAge") / 1000.0);
    v24 = CFSTR("SCAN_MAXAGE");
  }
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, v24);
  v25 = sub_100110470(v12, v10, v13, (uint64_t)sub_10014E840, (uint64_t)a3);
  if (v25)
    v26 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CWFManagerErrorDomain, v25, 0);
  else
    v26 = 0;
  CFRelease(v22);
  if (v26)
  {
LABEL_20:
    if (objc_msgSend(a3, "response"))
    {
      v27 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
      v27[2](v27, v26, 0);
    }

  }
}

- (void)__performRanging:(id)a3
{
  id v3;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  __WiFiDeviceManager *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  int v21;
  NSErrorDomain v22;
  uint64_t v23;
  NSError *v24;
  void (**v25)(id, NSError *, _QWORD);
  uint64_t v26;
  const void *v27;
  unint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = a3;
  v5 = a3;
  v6 = objc_msgSend(v3, "info");
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", CWFXPCRangingPeerListKey);
  if (!v7
    || (v8 = v7,
        v9 = objc_msgSend(v3, "info"),
        v10 = objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", CWFXPCRangingTimeoutKey), "unsignedIntegerValue"), (v11 = objc_msgSend(objc_msgSend(v3, "requestParameters"), "interfaceName")) == 0))
  {
    v22 = NSPOSIXErrorDomain;
    v23 = 22;
    goto LABEL_26;
  }
  v12 = v11;
  v13 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
  if (!v13)
  {
    v22 = NSPOSIXErrorDomain;
    v23 = 6;
    goto LABEL_26;
  }
  v26 = (uint64_t)v13;
  v27 = v12;
  v28 = (unint64_t)v10;
  v29 = (uint64_t)v3;
  v14 = +[NSMutableArray array](NSMutableArray, "array");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v8);
        v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v20 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
        if (objc_msgSend(v19, "MACAddress"))
          objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v19, "MACAddress"), CFSTR("STATION_MAC"));
        if (objc_msgSend(v19, "PMK"))
          objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v19, "PMK"), CFSTR("RANGING_PMK"));
        if (objc_msgSend(v19, "identifier"))
          objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v19, "identifier"), CFSTR("RANGING_TOKEN_ID"));
        if (objc_msgSend(v19, "numberOfMeasurements"))
          objc_msgSend(v20, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "numberOfMeasurements")), CFSTR("RANGING_NUM_MEASUREMENTS"));
        if (objc_msgSend(v19, "useCoreRotation"))
          objc_msgSend(v20, "setObject:forKeyedSubscript:", &off_100253998, CFSTR("RANGING_CORE_MASK"));
        objc_msgSend(v14, "addObject:", v20);
      }
      v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v16);
  }
  v3 = (id)v29;
  v21 = sub_100110798(v26, v27, (const __CFArray *)v14, (uint64_t)sub_10014ECC8, v29, (double)v28);
  if (v21)
  {
    v22 = (NSErrorDomain)CWFManagerErrorDomain;
    v23 = v21;
LABEL_26:
    v24 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, v23, 0);
    if (v24)
    {
      if (objc_msgSend(v3, "response"))
      {
        v25 = (void (**)(id, NSError *, _QWORD))objc_msgSend(v3, "response");
        v25[2](v25, v24, 0);
      }

    }
  }
}

- (void)__setRangeable:(id)a3
{
  id v3;
  id v5;
  id v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  __WiFiDeviceManager *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  int v18;
  NSError *v19;
  void (**v20)(id, NSError *, _QWORD);
  NSErrorDomain v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v3 = a3;
  v5 = objc_msgSend(a3, "info");
  obj = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCRangingPeerListKey);
  if (!obj
    || (v6 = objc_msgSend(v3, "info"),
        v7 = objc_msgSend(objc_msgSend(v6, "objectForKeyedSubscript:", CWFXPCRangeableKey), "BOOLValue"),
        (v8 = objc_msgSend(objc_msgSend(v3, "requestParameters"), "interfaceName")) == 0))
  {
    v21 = NSPOSIXErrorDomain;
    v22 = 22;
LABEL_19:
    v19 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v21, v22, 0);
    goto LABEL_14;
  }
  v9 = (uint64_t)v8;
  v10 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v8);
  if (!v10)
  {
    v21 = NSPOSIXErrorDomain;
    v22 = 6;
    goto LABEL_19;
  }
  v24 = (uint64_t)v10;
  v25 = v9;
  v26 = v7;
  v23 = v3;
  v11 = +[NSMutableArray array](NSMutableArray, "array");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v17 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
        objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(v16, "MACAddress"), CFSTR("STATION_MAC"));
        objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(v16, "PMK"), CFSTR("RANGING_PMK"));
        objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(v16, "identifier"), CFSTR("RANGING_TOKEN_ID"));
        objc_msgSend(v11, "addObject:", v17);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }
  v18 = sub_100110780(v24, v25, v26, (const __CFArray *)v11);
  if (v18)
    v19 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CWFManagerErrorDomain, v18, 0);
  else
    v19 = 0;
  v3 = v23;
LABEL_14:
  if (objc_msgSend(v3, "response"))
  {
    v20 = (void (**)(id, NSError *, _QWORD))objc_msgSend(v3, "response");
    v20[2](v20, v19, 0);
  }
}

- (void)__setRangingIdentifier:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  __WiFiDeviceManager *v9;
  uint64_t v10;
  id v11;
  int v12;
  NSError *v13;
  void (**v14)(id, NSError *, _QWORD);
  NSErrorDomain v15;
  uint64_t v16;

  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCRangingIdentifierKey);
  v7 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v7)
  {
    v8 = (uint64_t)v7;
    v9 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v7);
    if (v9)
    {
      v10 = (uint64_t)v9;
      if (v6)
      {
        v11 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("RANGING_TOKEN_ID"));
      }
      else
      {
        v11 = 0;
      }
      v12 = sub_100110790(v10, v8, v11 != 0, (uint64_t)v11);
      if (!v12)
      {
        v13 = 0;
        goto LABEL_8;
      }
      v15 = (NSErrorDomain)CWFManagerErrorDomain;
      v16 = v12;
    }
    else
    {
      v15 = NSPOSIXErrorDomain;
      v16 = 6;
    }
  }
  else
  {
    v15 = NSPOSIXErrorDomain;
    v16 = 22;
  }
  v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, v16, 0);
LABEL_8:
  if (objc_msgSend(a3, "response"))
  {
    v14 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v14[2](v14, v13, 0);
  }
}

- (void)__handleActivity:(id)a3
{
  id v5;
  id v6;
  NSError *v7;
  unsigned int v8;
  __WiFiManager *managerRef;
  void (**v10)(id, NSError *, _QWORD);

  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCActivityKey);
  if (v6)
  {
    v7 = 0;
    switch((unint64_t)objc_msgSend(v6, "type"))
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
        sub_100093E6C((uint64_t)self->_managerRef);
        goto LABEL_11;
      case 4uLL:
        sub_10000A77C((uint64_t)self->_managerRef, 0, 0, 2);
        goto LABEL_11;
      case 5uLL:
        sub_100005838((uint64_t)self->_managerRef, 0, 0);
        goto LABEL_11;
      case 6uLL:
        sub_100093F68((uint64_t)self->_managerRef);
        goto LABEL_11;
      case 8uLL:
        v8 = -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 8);
        managerRef = self->_managerRef;
        if (v8)
          sub_10009CFA4((uint64_t)managerRef);
        else
          sub_10009D090((uint64_t)managerRef);
        goto LABEL_11;
      case 0xCuLL:
        sub_100093F70((uint64_t)self->_managerRef, -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 12));
LABEL_11:
        v7 = 0;
        break;
      default:
        break;
    }
  }
  else
  {
    v7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0);
  }
  if (objc_msgSend(a3, "response"))
  {
    v10 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v10[2](v10, v7, 0);
  }
}

- (void)__getUserAutoJoinState:(id)a3
{
  int v4;
  id v5;
  id v6;
  void *v7;
  void (**v8)(id, _QWORD, id);

  v4 = sub_10000AF8C((uint64_t)self->_managerRef);
  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v6 = v5;
  if (v4)
    v7 = &__kCFBooleanFalse;
  else
    v7 = &__kCFBooleanTrue;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CWFXPCResultKey);
  if (objc_msgSend(a3, "response"))
  {
    v8 = (void (**)(id, _QWORD, id))objc_msgSend(a3, "response");
    v8[2](v8, 0, v6);
  }
}

- (void)__setUserAutoJoinState:(id)a3 XPCConnection:(id)a4
{
  id v7;
  id v8;
  NSError *v9;
  void (**v10)(id, NSError *, _QWORD);

  v7 = objc_msgSend(a3, "info");
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", CWFXPCUserAutoJoinStateKey);
  if (v8)
  {
    sub_1000898A0((uint64_t)self->_managerRef, (uint64_t)objc_msgSend(v8, "BOOLValue"), 0, (uint64_t)objc_msgSend(a4, "processName"));
    v9 = 0;
  }
  else
  {
    v9 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0);
  }
  if (objc_msgSend(a3, "response"))
  {
    v10 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v10[2](v10, v9, 0);
  }
}

- (void)__performAutoJoin:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  __WiFiDeviceManager *v9;
  uint64_t v10;
  NSError *v11;
  NSError *v12;
  void (**v13)(id, NSError *, _QWORD);
  _QWORD v14[5];

  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCAutoJoinParamsKey);
  if (v6 && (v7 = v6, (v8 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) != 0))
  {
    v9 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v8);
    if (v9)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10014F868;
      v14[3] = &unk_10022EEC0;
      v14[4] = a3;
      sub_10011EA74(v9, v7, (uint64_t)v14);
      return;
    }
    v10 = 6;
  }
  else
  {
    v10 = 22;
  }
  v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v10, 0);
  if (v11)
  {
    v12 = v11;
    if (objc_msgSend(a3, "response"))
    {
      v13 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
      v13[2](v13, v12, 0);
    }
  }
}

- (void)__getAutoHotspotMode:(id)a3
{
  unsigned int v4;
  id v5;
  void (**v6)(id, _QWORD, id);

  v4 = sub_1000A5A54((uint64_t)self->_managerRef);
  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", sub_1000E71E8(v4)), CWFXPCResultKey);
  if (objc_msgSend(a3, "response"))
  {
    v6 = (void (**)(id, _QWORD, id))objc_msgSend(a3, "response");
    v6[2](v6, 0, v5);
  }
}

- (void)__setAutoHotspotMode:(id)a3
{
  id v5;
  id v6;
  __WiFiManager *managerRef;
  int v8;
  NSError *v9;
  void (**v10)(id, NSError *, _QWORD);

  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCAutoHotspotModeKey);
  if (v6)
  {
    managerRef = self->_managerRef;
    v8 = sub_1000E71F8((uint64_t)objc_msgSend(v6, "integerValue"));
    sub_1000A5978(managerRef, v8, 0);
    v9 = 0;
  }
  else
  {
    v9 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0);
  }
  if (objc_msgSend(a3, "response"))
  {
    v10 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v10[2](v10, v9, 0);
  }
}

- (void)__getUserSettings:(id)a3
{
  id v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  id v9;
  void (**v10)(id, _QWORD, id);

  v5 = objc_alloc_init((Class)CWFUserSettings);
  v6 = sub_1000A5A54((uint64_t)self->_managerRef);
  objc_msgSend(v5, "setAutoHotspotMode:", sub_1000E71E8(v6));
  v7 = sub_100091D64((uint64_t)self->_managerRef);
  objc_msgSend(v5, "setAskToJoinMode:", sub_1000E722C(v7));
  v8 = sub_100031A74((uint64_t)self->_managerRef);
  objc_msgSend(v5, "setCompatibilityMode:", sub_1000E7210(v8));
  objc_msgSend(v5, "setOSSpecificAttributes:", -[WiFiXPCManager __OSSpecificAttributes](self, "__OSSpecificAttributes"));
  v9 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CWFXPCResultKey);

  if (objc_msgSend(a3, "response"))
  {
    v10 = (void (**)(id, _QWORD, id))objc_msgSend(a3, "response");
    v10[2](v10, 0, v9);
  }
}

- (void)__setUserSettings:(id)a3
{
  id v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL8 v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  __CFString *v31;
  __CFString *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t isKindOfClass;
  uint64_t v47;
  NSObject *v48;
  id v49;
  NSError *v50;
  void (**v51)(id, NSError *, _QWORD);
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  int v62;
  __CFString *v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];

  v3 = a3;
  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCUserSettingsKey);
  if (v6)
  {
    v7 = v6;
    v53 = v3;
    v8 = objc_msgSend(v3, "info");
    v9 = objc_msgSend(v8, "objectForKeyedSubscript:", CWFXPCUserSettingsPropertiesKey);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v59 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
          v15 = objc_msgSend(v14, "integerValue");
          switch((unint64_t)v15)
          {
            case 1uLL:
              v16 = sub_1000E71F8((uint64_t)objc_msgSend(v7, "askToJoinMode"));
              v17 = v16;
              v18 = CWFGetOSLog(v16);
              if (v18)
                v19 = CWFGetOSLog(v18);
              else
                v19 = &_os_log_default;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                v62 = 67109120;
                LODWORD(v63) = v17;
                _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 1, "[corewifi] Setting user setting for ask to join to %d", &v62);
              }
              sub_100091C3C((uint64_t)self->_managerRef, v17, 0);
              break;
            case 2uLL:
              v20 = sub_1000E71F8((uint64_t)objc_msgSend(v7, "autoHotspotMode"));
              v21 = v20;
              v22 = CWFGetOSLog(v20);
              if (v22)
                v23 = CWFGetOSLog(v22);
              else
                v23 = &_os_log_default;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                v62 = 67109120;
                LODWORD(v63) = v21;
                _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v23, 1, "[corewifi] Setting user setting for auto hotspot to %d", &v62);
              }
              sub_1000A5978(self->_managerRef, v21, 0);
              break;
            case 3uLL:
              v24 = CWFGetOSLog(v15);
              if (v24)
                v25 = CWFGetOSLog(v24);
              else
                v25 = &_os_log_default;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                v31 = (__CFString *)objc_msgSend(v7, "syncMode");
                v62 = 134217984;
                v63 = v31;
                _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v25, 1, "[corewifi] Setting user setting sync mode to %ld", &v62);
              }
              nullsub_3(self->_managerRef, objc_msgSend(v7, "syncMode"));
              break;
            case 4uLL:
              v26 = sub_1000E7220((uint64_t)objc_msgSend(v7, "compatibilityMode"));
              v27 = CWFGetOSLog(v26);
              if (v27)
                v28 = CWFGetOSLog(v27);
              else
                v28 = &_os_log_default;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                v62 = 67109120;
                LODWORD(v63) = v26;
                _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v28, 1, "[corewifi] Setting user setting compatibility mode to %d", &v62);
              }
              sub_100091D6C((uint64_t)self->_managerRef, v26, 0);
              break;
            default:
              v29 = CWFGetOSLog(v15);
              if (v29)
                v30 = CWFGetOSLog(v29);
              else
                v30 = &_os_log_default;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                v32 = (__CFString *)objc_msgSend(v14, "integerValue");
                v62 = 134217984;
                v63 = v32;
                _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v30, 16, "[corewifi] Unhandled set user settings property (%ld)", &v62);
              }
              break;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      }
      while (v11);
    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v33 = objc_msgSend(v7, "OSSpecificAttributes");
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v55;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v55 != v36)
            objc_enumerationMutation(v33);
          v38 = *(__CFString **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v37);
          v39 = objc_msgSend(objc_msgSend(v7, "OSSpecificAttributes"), "objectForKey:", v38);
          v40 = CWFGetOSLog(v39);
          if (v40)
            v41 = CWFGetOSLog(v40);
          else
            v41 = &_os_log_default;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v62 = 138412546;
            v63 = v38;
            v64 = 2112;
            v65 = v39;
            LODWORD(v52) = 22;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v41, 1, "[corewifi] Setting user setting (os specific) for %@ to %@", &v62, v52);
          }
          v42 = -[__CFString isEqualToString:](v38, "isEqualToString:", CFSTR("Custom network settings"));
          if ((_DWORD)v42)
          {
            v43 = CWFGetOSLog(v42);
            if (v43)
              v44 = CWFGetOSLog(v43);
            else
              v44 = &_os_log_default;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              LOWORD(v62) = 0;
              LODWORD(v52) = 2;
              _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v44, 1, "[corewifi] Setting custom network settings", &v62, v52);
            }
            if (v39
              && (v45 = objc_opt_class(NSDictionary),
                  isKindOfClass = objc_opt_isKindOfClass(v39, v45),
                  (isKindOfClass & 1) == 0))
            {
              v47 = CWFGetOSLog(isKindOfClass);
              if (v47)
                v48 = CWFGetOSLog(v47);
              else
                v48 = &_os_log_default;
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                LOWORD(v62) = 0;
                LODWORD(v52) = 2;
                _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v48, 16, "[corewifi] Custom network settings is neither nil or of type NSDictionary", &v62, v52);
              }
            }
            else
            {
              sub_1000A6104((uint64_t)self->_managerRef, (uint64_t)v39);
            }
          }
          else
          {
            sub_100093FA0(self->_managerRef, v38, v39);
          }
          v37 = (char *)v37 + 1;
        }
        while (v35 != v37);
        v49 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
        v35 = v49;
      }
      while (v49);
    }
    -[WiFiXPCManager sendUserSettingsDidChangeEvent](self, "sendUserSettingsDidChangeEvent");
    v50 = 0;
    v3 = v53;
  }
  else
  {
    v50 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0);
  }
  if (objc_msgSend(v3, "response"))
  {
    v51 = (void (**)(id, NSError *, _QWORD))objc_msgSend(v3, "response");
    v51[2](v51, v50, 0);
  }
}

- (id)__OSSpecificAttributes
{
  id v3;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("WAPIEnabled"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("DiagnosticsEnabled"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("SBWiFiDontAskShown"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("kWiFiWhitelistingUUIDKey"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("KeepWiFiPoweredAirplaneModeEnabled"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("KeepWiFiPoweredAirplaneMode"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("WiFiMobileAssetIsHealthMonitorDisabled"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("deviceSpecificKeyMacRandomisation"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("RotationKeyMacRandomisation"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("WiFiCountryBandSupportKey"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("kWiFiWhitelistingUUIDKey"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("Custom network settings"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("kWiFiShowUnprovisionedHS20Networks"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("WiFiSettingsLogging"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("WiFiATJPickerLogging"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("WiFiATJPickerLogging"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("DisableSoftErrorReporting"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("EnableRangingLogDump"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("UserPreferenceJoinAlertMode"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("EnableRangingLogDump"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("lpasEnable"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("mStageAutoJoin"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("optimizedAutoJoin"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("TrgDiscAskIfAppropriateDisconnect"), v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:](self, "__setOSSpecificAttributeForKey:attributes:", CFSTR("WakeMode"), v3);
  return v3;
}

- (void)__setOSSpecificAttributeForKey:(__CFString *)a3 attributes:(id)a4
{
  unsigned int v7;
  __WiFiManager *managerRef;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  const __SCPreferences *v11;

  v7 = -[__CFString isEqualToString:](a3, "isEqualToString:", CFSTR("Custom network settings"));
  managerRef = self->_managerRef;
  if (v7)
  {
    v9 = sub_1000A60FC(managerRef);
    if (v9)
    {
      v10 = v9;
      objc_msgSend(a4, "setObject:forKey:", v9, a3);
      CFRelease(v10);
    }
  }
  else
  {
    v11 = sub_100092D68(managerRef, a3);
    if (v11)
      objc_msgSend(a4, "setObject:forKey:", v11, a3);
  }
}

- (WiFiXPCManager)init
{
  WiFiXPCManager *v2;
  NSOperationQueue *v3;
  CWFXPCManager *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WiFiXPCManager;
  v2 = -[WiFiXPCManager init](&v14, "init");
  if (!v2)
    goto LABEL_12;
  v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  v2->_wifiManagerQueue = v3;
  if (!v3)
    goto LABEL_12;
  -[NSOperationQueue setMaxConcurrentOperationCount:](v3, "setMaxConcurrentOperationCount:", -1);
  -[NSOperationQueue setQualityOfService:](v2->_wifiManagerQueue, "setQualityOfService:", -1);
  v4 = (CWFXPCManager *)objc_msgSend(objc_alloc((Class)CWFXPCManager), "initWithServiceTypes:", &off_100254130);
  v2->_XPCManager = v4;
  if (!v4)
    goto LABEL_12;
  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v2->_peerAssistedDiscoveryNetworkMap = v5;
  if (!v5)
    goto LABEL_12;
  v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v2->_wifiAssistOverrideReasonsMap = v6;
  if (!v6)
    goto LABEL_12;
  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = dispatch_queue_create(0, v7);
  v2->_mutexQueue = (OS_dispatch_queue *)v8;
  if (!v8)
    goto LABEL_12;
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = dispatch_queue_create("com.apple.wifid.current-network", v9);
  v2->_currentNetworkQueue = (OS_dispatch_queue *)v10;
  if (v10
    && (v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary),
        (v2->_currentNetworkMap = v11) != 0)
    && (v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary),
        (v2->_currentKnownNetworkMap = v12) != 0))
  {
    -[CWFXPCManager setSupportedRequestTypes:](v2->_XPCManager, "setSupportedRequestTypes:", +[NSSet setWithArray:](NSSet, "setWithArray:", -[WiFiXPCManager __supportedRequestTypes](v2, "__supportedRequestTypes")));
    -[CWFXPCManager setDelegate:](v2->_XPCManager, "setDelegate:", v2);
  }
  else
  {
LABEL_12:

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  NSObject *mutexQueue;
  NSObject *currentNetworkQueue;
  __WiFiNetwork *cachedCurrentSessionBasedNetworkRef;
  __WiFiManager *managerRef;
  objc_super v7;

  self->_wifiManagerQueue = 0;
  -[CWFXPCManager setDelegate:](self->_XPCManager, "setDelegate:", 0);
  -[CWFXPCManager invalidate](self->_XPCManager, "invalidate");

  self->_XPCManager = 0;
  self->_peerAssistedDiscoveryNetworkMap = 0;

  self->_wifiAssistOverrideReasonsMap = 0;
  self->_currentHotspotNetwork = 0;

  self->_currentNetworkMap = 0;
  self->_currentKnownNetworkMap = 0;
  mutexQueue = self->_mutexQueue;
  if (mutexQueue)
    dispatch_release(mutexQueue);
  currentNetworkQueue = self->_currentNetworkQueue;
  if (currentNetworkQueue)
    dispatch_release(currentNetworkQueue);
  cachedCurrentSessionBasedNetworkRef = self->_cachedCurrentSessionBasedNetworkRef;
  if (cachedCurrentSessionBasedNetworkRef)
  {
    CFRelease(cachedCurrentSessionBasedNetworkRef);
    self->_cachedCurrentSessionBasedNetworkRef = 0;
  }
  managerRef = self->_managerRef;
  if (managerRef)
  {
    CFRelease(managerRef);
    self->_managerRef = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)WiFiXPCManager;
  -[WiFiXPCManager dealloc](&v7, "dealloc");
}

- (void)setWiFiManager:(__WiFiManager *)a3
{
  __WiFiManager *managerRef;
  __WiFiManager *v6;

  managerRef = self->_managerRef;
  if (managerRef != a3)
  {
    if (managerRef)
      CFRelease(managerRef);
    if (a3)
      v6 = (__WiFiManager *)CFRetain(a3);
    else
      v6 = 0;
    self->_managerRef = v6;
  }
}

- (__WiFiManager)getWiFiManager
{
  return self->_managerRef;
}

- (void)activate
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[WiFiXPCManager __supportedRequestTypes](self, "__supportedRequestTypes", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[CWFXPCManager setTargetQueue:requestType:interfaceName:](self->_XPCManager, "setTargetQueue:requestType:interfaceName:", self->_wifiManagerQueue, objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "integerValue"), 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[CWFXPCManager resume](self->_XPCManager, "resume");
}

- (void)invalidate
{
  -[CWFXPCManager invalidate](self->_XPCManager, "invalidate");
}

- (void)sendWoWDidChangeEventWithInterfaceName:(id)a3
{
  void *v5;
  id v6;

  v5 = objc_autoreleasePoolPush();
  v6 = objc_alloc_init((Class)CWFXPCEvent);
  objc_msgSend(v6, "setType:", 9);
  objc_msgSend(v6, "setInterfaceName:", a3);
  objc_msgSend(v6, "setTimestamp:", +[NSDate date](NSDate, "date"));
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v6, 0);
  objc_autoreleasePoolPop(v5);
}

- (void)sendInternetRelayLinkChangedEvent:(BOOL)a3 rssi:(int64_t)a4 interfaceName:(id)a5
{
  _BOOL8 v7;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  _DWORD v15[2];
  __int16 v16;
  int64_t v17;
  uint64_t v18;
  id v19;

  v7 = a3;
  v9 = objc_autoreleasePoolPush();
  v10 = objc_alloc_init((Class)CWFXPCEvent);
  objc_msgSend(v10, "setType:", 6);
  objc_msgSend(v10, "setInterfaceName:", a5);
  objc_msgSend(v10, "setTimestamp:", +[NSDate date](NSDate, "date"));
  v11 = objc_alloc_init((Class)CWFLinkChangeStatus);
  objc_msgSend(v11, "setLinkDown:", v7);
  objc_msgSend(v11, "setRSSI:", a4);
  v18 = CWFEventLinkChangeStatusKey;
  v19 = v11;
  v12 = CWFGetOSLog(objc_msgSend(v10, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1)));
  if (v12)
    v13 = CWFGetOSLog(v12);
  else
    v13 = &_os_log_default;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109376;
    v15[1] = v7;
    v16 = 2048;
    v17 = a4;
    LODWORD(v14) = 18;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[corewifi] sendInternetRelayLinkChangedEvent send event to CoreWiFi isLinkDown:%d rssi:%ld dBm \n", v15, v14);
  }
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v10, 0);
  objc_autoreleasePoolPop(v9);
}

- (void)replayLinkUpEventWithInterfaceName:(id)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v5 = objc_autoreleasePoolPush();
  v6 = objc_alloc_init((Class)CWFXPCEvent);
  objc_msgSend(v6, "setType:", 6);
  objc_msgSend(v6, "setInterfaceName:", a3);
  objc_msgSend(v6, "setTimestamp:", +[NSDate date](NSDate, "date"));
  v7 = objc_alloc_init((Class)CWFLinkChangeStatus);
  objc_msgSend(v7, "setLinkDown:", 0);
  v12 = CWFEventLinkChangeStatusKey;
  v13 = v7;
  v8 = CWFGetOSLog(objc_msgSend(v6, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)));
  if (v8)
    v9 = CWFGetOSLog(v8);
  else
    v9 = &_os_log_default;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[WiFiXPCManager replayLinkUpEventWithInterfaceName:]";
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[corewifi] %s", (const char *)&v10);
  }
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v6, 0);
  objc_autoreleasePoolPop(v5);
}

- (void)autoJoinStartedWithTrigger:(int64_t)a3 interfaceName:(id)a4
{
  void *v7;
  id v8;
  uint64_t v9;
  NSNumber *v10;

  v7 = objc_autoreleasePoolPush();
  v8 = objc_alloc_init((Class)CWFXPCEvent);
  objc_msgSend(v8, "setInternalType:", 1);
  objc_msgSend(v8, "setInterfaceName:", a4);
  objc_msgSend(v8, "setTimestamp:", +[NSDate date](NSDate, "date"));
  v9 = CWFInternalEventAutoJoinTriggerKey;
  v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3);
  objc_msgSend(v8, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v8, 0);
  objc_autoreleasePoolPop(v7);
}

- (void)autoJoinUpdatedWithState:(int64_t)a3 interfaceName:(id)a4
{
  void *v7;
  id v8;
  uint64_t v9;
  NSNumber *v10;

  v7 = objc_autoreleasePoolPush();
  v8 = objc_alloc_init((Class)CWFXPCEvent);
  objc_msgSend(v8, "setInternalType:", 1);
  objc_msgSend(v8, "setInterfaceName:", a4);
  objc_msgSend(v8, "setTimestamp:", +[NSDate date](NSDate, "date"));
  v9 = CWFInternalEventAutoJoinStateKey;
  v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3);
  objc_msgSend(v8, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v8, 0);
  objc_autoreleasePoolPop(v7);
}

- (void)autoJoinEndedWithResult:(BOOL)a3 interfaceName:(id)a4
{
  _BOOL8 v5;
  void *v7;
  id v8;
  id v9;
  NSNumber *v10;

  v5 = a3;
  v7 = objc_autoreleasePoolPush();
  v8 = objc_alloc_init((Class)CWFXPCEvent);
  objc_msgSend(v8, "setInternalType:", 1);
  objc_msgSend(v8, "setInterfaceName:", a4);
  objc_msgSend(v8, "setTimestamp:", +[NSDate date](NSDate, "date"));
  v9 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CWFInternalEventAutoJoinResultKey);
  objc_msgSend(v8, "setInfo:", v9);
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v8, 0);
  objc_autoreleasePoolPop(v7);
}

- (void)willAssociateWithNetwork:(__WiFiNetwork *)a3 isAutoJoin:(BOOL)a4 interfaceName:(id)a5
{
  _BOOL8 v6;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v6 = a4;
  v9 = objc_autoreleasePoolPush();
  v10 = sub_100027D10((uint64_t)a3);
  if (v10)
  {
    v11 = v10;
    v12 = objc_alloc_init((Class)CWFXPCEvent);
    objc_msgSend(v12, "setInternalType:", 2);
    objc_msgSend(v12, "setInterfaceName:", a5);
    objc_msgSend(v12, "setTimestamp:", +[NSDate date](NSDate, "date"));
    v13[0] = CWFInternalEventScanResultKey;
    v13[1] = CWFInternalEventIsAutoJoinKey;
    v14[0] = v11;
    v14[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6);
    objc_msgSend(v12, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
    -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v12, 0);
  }
  objc_autoreleasePoolPop(v9);
}

- (void)associationDoneWithNetwork:(__WiFiNetwork *)a3 error:(int)a4 interfaceName:(id)a5
{
  void *v9;
  id v10;
  id v11;
  id v12;
  NSError *v13;
  id v14;

  v9 = objc_autoreleasePoolPush();
  v10 = sub_100027D10((uint64_t)a3);
  if (v10)
  {
    v11 = v10;
    v12 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CWFManagerErrorDomain, a4, 0);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CWFInternalEventErrorKey);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CWFInternalEventScanResultKey);
    v14 = objc_alloc_init((Class)CWFXPCEvent);
    objc_msgSend(v14, "setInternalType:", 3);
    objc_msgSend(v14, "setInterfaceName:", a5);
    objc_msgSend(v14, "setTimestamp:", +[NSDate date](NSDate, "date"));
    objc_msgSend(v14, "setInfo:", v12);
    -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v14, 0);
  }
  objc_autoreleasePoolPop(v9);
}

- (void)sendUserAutoJoinStateDidChangeEvent
{
  void *v3;
  id v4;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_alloc_init((Class)CWFXPCEvent);
  objc_msgSend(v4, "setType:", 25);
  objc_msgSend(v4, "setTimestamp:", +[NSDate date](NSDate, "date"));
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v4, 0);
  objc_autoreleasePoolPop(v3);
}

- (void)sendAutoHotspotModeDidChangeEvent
{
  void *v3;
  id v4;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_alloc_init((Class)CWFXPCEvent);
  objc_msgSend(v4, "setType:", 26);
  objc_msgSend(v4, "setTimestamp:", +[NSDate date](NSDate, "date"));
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v4, 0);
  objc_autoreleasePoolPop(v3);
}

- (void)sendXPCEvent:(id)a3
{
  void *v5;

  v5 = objc_autoreleasePoolPush();
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", a3, 0);
  objc_autoreleasePoolPop(v5);
}

- (void)sendKnownNetworkDidChangeEventForProfile:(id)a3 eventType:(int64_t)a4
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSNumber *v11;

  v7 = objc_autoreleasePoolPush();
  v8 = objc_alloc_init((Class)CWFXPCEvent);
  objc_msgSend(v8, "setType:", 30);
  objc_msgSend(v8, "setTimestamp:", +[NSDate date](NSDate, "date"));
  v9 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v10 = v9;
  if (a3)
    objc_msgSend(v9, "setObject:forKey:", a3, CWFInternalEventKnownNetworkProfileKey);
  v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4);
  objc_msgSend(v10, "setObject:forKey:", v11, CWFInternalEventKnownNetworkEventTypeKey);
  objc_msgSend(v8, "setInfo:", v10);
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v8, 0);
  objc_autoreleasePoolPop(v7);
}

- (void)sendWiFiAssistEventWithInterfaceName:(id)a3 linkQualityMetricInfo:(id)a4
{
  void *v7;
  id v8;
  id v9;
  id v10;
  NSObject *mutexQueue;
  id v12;
  NSDictionary *v13;
  _QWORD block[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  id v20;

  v7 = objc_autoreleasePoolPush();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v8 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("WIFI_ASSIST_OVERRIDE_REASON"));
  if (v8)
  {
    v9 = +[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet");
    objc_msgSend(v9, "addObject:", v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("WIFI_ASSIST_OVERRIDE_REASONS"));
  if (objc_msgSend(v10, "count"))
  {
    if (!v9)
      v9 = +[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet");
    objc_msgSend(v9, "addObjectsFromArray:", v10);
  }
  mutexQueue = self->_mutexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015160C;
  block[3] = &unk_1002324A0;
  block[4] = self;
  block[5] = a3;
  block[6] = v9;
  block[7] = &v15;
  dispatch_sync(mutexQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    v12 = objc_alloc_init((Class)CWFXPCEvent);
    objc_msgSend(v12, "setType:", 34);
    objc_msgSend(v12, "setInterfaceName:", a3);
    objc_msgSend(v12, "setTimestamp:", +[NSDate date](NSDate, "date"));
    if (v9)
    {
      v19 = CWFEventWiFiAssistOverrideReasonsKey;
      v20 = objc_msgSend(v9, "array");
      v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v12, "setInfo:", v13);
    -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v12, 0);
  }
  _Block_object_dispose(&v15, 8);
  objc_autoreleasePoolPop(v7);
}

- (id)__sanitizeSensingParams:(id)a3
{
  if (((unint64_t)objc_msgSend(a3, "numberOfReports") & 0x8000000000000000) != 0
    || (unint64_t)objc_msgSend(objc_msgSend(a3, "matchMACAddresses"), "count") > 0x20
    || ((unint64_t)objc_msgSend(a3, "timeout") & 0x8000000000000000) != 0
    || (uint64_t)objc_msgSend(a3, "timeout") > 50000
    || (uint64_t)objc_msgSend(a3, "scheduleOnceAfter") < -2
    || (uint64_t)objc_msgSend(a3, "scheduleOnceAfter") > 15
    || (uint64_t)objc_msgSend(a3, "scheduleDailyAt") < -2
    || (uint64_t)objc_msgSend(a3, "scheduleDailyAt") >= 86401)
  {
    return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0);
  }
  else
  {
    return 0;
  }
}

- (id)__getSensingParams:(id)a3
{
  id v4;
  NSUserDefaults *v5;
  id v6;

  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "numberOfReports")), CFSTR("SENSING_PARAMS_NUMBER_OF_REPORTS"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(a3, "matchFrameType")), CFSTR("SENSING_PARAMS_MATCH_FRAME_TYPE"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(a3, "matchMACAddresses"), CFSTR("SENSING_PARAMS_MATCH_MAC_ADDRESS"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "timeout")), CFSTR("SENSING_PARAMS_TIMEOUT"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "submitMetric")), CFSTR("SENSING_PARAMS_SUBMIT_METRIC"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "scheduleDailyAt")), CFSTR("SENSING_PARAMS_SCHEDULE_DAILY_AT"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(a3, "activityLabels"), CFSTR("SENSING_PARAMS_ACTIVITY_LABELS"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(a3, "placeLabels"), CFSTR("SENSING_PARAMS_PLACE_LABELS"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(a3, "comment"), CFSTR("SENSING_PARAMS_COMMENT"));
  if (objc_msgSend(a3, "scheduleDailyAt") != (id)-2)
  {
    v5 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    if (objc_msgSend(a3, "scheduleDailyAt") == (id)-1)
      -[NSUserDefaults removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("WIFI_SENSING"));
    else
      -[NSUserDefaults setObject:forKey:](v5, "setObject:forKey:", v4, CFSTR("WIFI_SENSING"));
  }
  v6 = objc_msgSend(a3, "scheduleOnceAfter");
  if (objc_msgSend(a3, "scheduleOnceAfter") == (id)-2 && objc_msgSend(a3, "scheduleDailyAt") == (id)-2)
    v6 = 0;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6), CFSTR("SENSING_PARAMS_SCHEDULE_ONCE_AFTER"));
  return v4;
}

- (void)__performSensing:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  const void *v9;
  __WiFiDeviceManager *v10;
  uint64_t v11;
  NSError *v12;
  id v13;
  void *v14;
  int v15;
  NSErrorDomain v16;
  uint64_t v17;
  NSError *v18;
  id v19;
  void (**v20)(id, NSError *, _QWORD);

  v4 = a3;
  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCSensingParamsKey);
  if (!v6)
    goto LABEL_10;
  v7 = v6;
  v8 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (!v8)
    goto LABEL_10;
  v9 = v8;
  v10 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v8);
  if (!v10)
  {
    v16 = NSPOSIXErrorDomain;
    v17 = 6;
    goto LABEL_15;
  }
  v11 = (uint64_t)v10;
  v12 = -[WiFiXPCManager __sanitizeSensingParams:](self, "__sanitizeSensingParams:", v7);
  if (!v12)
  {
    v13 = -[WiFiXPCManager __getSensingParams:](self, "__getSensingParams:", v7);
    if (v13)
    {
      v14 = v13;
      if ((MGGetBoolAnswer(CFSTR("InternalBuild")) & 1) != 0
        && (_os_feature_enabled_impl("WiFiManager", "Sensing") & 1) != 0)
      {
        v15 = sub_10011FBE0(v11, v9, v14, (void (*)(uint64_t, const void *, _QWORD, uint64_t, uint64_t))sub_100151B68, (uint64_t)a3);
        if (!v15)
          return;
        v16 = (NSErrorDomain)CWFManagerErrorDomain;
        v17 = v15;
      }
      else
      {
        v16 = (NSErrorDomain)CWFManagerErrorDomain;
        v17 = -3907;
      }
LABEL_15:
      v18 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, v17, 0);
      v19 = a3;
      if (!v18)
        return;
      goto LABEL_16;
    }
LABEL_10:
    v16 = NSPOSIXErrorDomain;
    v17 = 22;
    goto LABEL_15;
  }
  v18 = v12;
  v19 = a3;
LABEL_16:
  if (objc_msgSend(v19, "response"))
  {
    v20 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v20[2](v20, v18, 0);
  }

}

- (void)__performNDD:(id)a3 XPCConnection:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  int v13;
  NSError *v14;
  void (**v15)(id, NSError *, _QWORD);
  NSErrorDomain v16;
  uint64_t v17;

  v7 = objc_msgSend(a3, "info");
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", CWFXPCNDDParamsKey);
  if (!v8)
    goto LABEL_10;
  v9 = (uint64_t)v8;
  v10 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (!v10)
    goto LABEL_10;
  if (!self->_managerRef)
  {
    v16 = NSPOSIXErrorDomain;
    v17 = 6;
    goto LABEL_13;
  }
  v11 = (uint64_t)v10;
  v12 = objc_msgSend(a4, "processName");
  if (v12)
  {
    v13 = sub_10009053C((uint64_t)self->_managerRef, (uint64_t)objc_msgSend(a3, "type"), v9, (uint64_t)v12, v11);
    if (!v13)
    {
      v14 = 0;
      goto LABEL_7;
    }
    v16 = (NSErrorDomain)CWFManagerErrorDomain;
    v17 = v13;
  }
  else
  {
LABEL_10:
    v16 = NSPOSIXErrorDomain;
    v17 = 22;
  }
LABEL_13:
  v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, v17, 0);
LABEL_7:
  if (objc_msgSend(a3, "response"))
  {
    v15 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v15[2](v15, v14, 0);
  }
}

- (void)sendUserSettingsDidChangeEvent
{
  void *v3;
  id v4;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_alloc_init((Class)CWFXPCEvent);
  objc_msgSend(v4, "setType:", 27);
  objc_msgSend(v4, "setTimestamp:", +[NSDate date](NSDate, "date"));
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v4, 0);
  objc_autoreleasePoolPop(v3);
}

- (void)__getAutoJoinMetric:(id)a3
{
  id v5;
  __WiFiDeviceManager *v6;
  id v7;
  id v8;
  _QWORD *v9;
  id v10;
  void (*v11)(_QWORD *, NSError *, id);
  _QWORD *v12;
  NSError *v13;
  uint64_t v14;
  NSError *v15;
  NSError *v16;

  v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      v7 = sub_10011EE88((uint64_t)v6);
      goto LABEL_4;
    }
    v14 = 6;
  }
  else
  {
    v14 = 22;
  }
  v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v14, 0);
  if (!v15)
  {
    v7 = 0;
LABEL_4:
    v8 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CWFXPCResultKey);
    if (objc_msgSend(a3, "response"))
    {
      v9 = objc_msgSend(a3, "response");
      v10 = objc_msgSend(v8, "copy");
      v11 = (void (*)(_QWORD *, NSError *, id))v9[2];
      v12 = v9;
      v13 = 0;
LABEL_6:
      v11(v12, v13, v10);
      return;
    }
    return;
  }
  v16 = v15;
  if (objc_msgSend(a3, "response"))
  {
    v12 = objc_msgSend(a3, "response");
    v11 = (void (*)(_QWORD *, NSError *, id))v12[2];
    v13 = v16;
    v10 = 0;
    goto LABEL_6;
  }
}

- (void)__getAutoJoinStatistics:(id)a3
{
  id v5;
  __WiFiDeviceManager *v6;
  id v7;
  id v8;
  _QWORD *v9;
  id v10;
  void (*v11)(_QWORD *, NSError *, id);
  _QWORD *v12;
  NSError *v13;
  uint64_t v14;
  NSError *v15;
  NSError *v16;

  v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      v7 = sub_10011EEA0((uint64_t)v6);
      goto LABEL_4;
    }
    v14 = 6;
  }
  else
  {
    v14 = 22;
  }
  v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v14, 0);
  if (!v15)
  {
    v7 = 0;
LABEL_4:
    v8 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CWFXPCResultKey);
    if (objc_msgSend(a3, "response"))
    {
      v9 = objc_msgSend(a3, "response");
      v10 = objc_msgSend(v8, "copy");
      v11 = (void (*)(_QWORD *, NSError *, id))v9[2];
      v12 = v9;
      v13 = 0;
LABEL_6:
      v11(v12, v13, v10);
      return;
    }
    return;
  }
  v16 = v15;
  if (objc_msgSend(a3, "response"))
  {
    v12 = objc_msgSend(a3, "response");
    v11 = (void (*)(_QWORD *, NSError *, id))v12[2];
    v13 = v16;
    v10 = 0;
    goto LABEL_6;
  }
}

- (void)__resetAutoJoinStatistics:(id)a3
{
  id v5;
  __WiFiDeviceManager *v6;
  NSError *v7;
  void (**v8)(id, NSError *, _QWORD);
  NSErrorDomain v9;
  uint64_t v10;

  v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      sub_10011EEB8((uint64_t)v6);
      v7 = 0;
      goto LABEL_4;
    }
    v9 = NSPOSIXErrorDomain;
    v10 = 6;
  }
  else
  {
    v9 = NSPOSIXErrorDomain;
    v10 = 22;
  }
  v7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, v10, 0);
LABEL_4:
  if (objc_msgSend(a3, "response"))
  {
    v8 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v8[2](v8, v7, 0);
  }
}

- (void)__setBlockedBands:(id)a3
{
  id v5;
  const __CFArray *v6;
  int v7;
  NSError *v8;
  void (**v9)(id, NSError *, _QWORD);
  NSErrorDomain v10;
  uint64_t v11;

  v5 = objc_msgSend(a3, "info");
  v6 = (const __CFArray *)objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCBlockedBandsKey);
  if (v6)
  {
    v7 = sub_1000ADA20((uint64_t)self->_managerRef, v6);
    if (!v7)
    {
      v8 = 0;
      goto LABEL_4;
    }
    v10 = (NSErrorDomain)CWFManagerErrorDomain;
    v11 = v7;
  }
  else
  {
    v10 = NSPOSIXErrorDomain;
    v11 = 22;
  }
  v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, v11, 0);
LABEL_4:
  if (objc_msgSend(a3, "response"))
  {
    v9 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v9[2](v9, v8, 0);
  }
}

- (void)__startHostAPMode:(id)a3 XPCConnection:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  __WiFiDeviceManager *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _UNKNOWN **v17;
  const __CFString *v18;
  void *v19;
  _UNKNOWN **v20;
  void *v21;
  int v22;
  NSErrorDomain v23;
  uint64_t v24;
  NSError *v25;
  void (**v26)(id, NSError *, _QWORD);
  _QWORD aBlock[5];

  v7 = a3;
  v8 = objc_msgSend(a3, "info");
  v9 = objc_msgSend(v8, "objectForKeyedSubscript:", CWFXPCHostAPConfigurationKey);
  if (!v9
    || (v10 = v9, (v11 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    v23 = NSPOSIXErrorDomain;
    v24 = 22;
    goto LABEL_22;
  }
  v12 = v11;
  v13 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
  if (!v13)
  {
    v23 = NSPOSIXErrorDomain;
    v24 = 6;
    goto LABEL_22;
  }
  v14 = (uint64_t)v13;
  v15 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (!objc_msgSend(v10, "channel"))
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("AP_MODE_MOVETOIOS_MIGRATION"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(v10, "SSID"), CFSTR("AP_MODE_SSID_BYTES"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(objc_msgSend(v10, "channel"), "channel")), CFSTR("CHANNEL"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(objc_msgSend(v10, "channel"), "flags")), CFSTR("CHANNEL_FLAGS"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "PHYMode")), CFSTR("AP_MODE_PHY_MODE"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "forceBeaconInterval100ms")), CFSTR("AP_MODE_FORCE_BI_100"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "forceHiddenMode")), CFSTR("SOFTAP_SOFTAP_HIDDEN_NETWORK"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(v10, "IEList"), CFSTR("AP_MODE_IE_LIST"));
  v16 = (uint64_t)objc_msgSend(v10, "securityType");
  if (v16 > 79)
  {
    if (v16 == 80)
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", &off_100253950, CFSTR("AP_MODE_AUTH_LOWER"));
      v17 = &off_100253A40;
      goto LABEL_15;
    }
    if (v16 == 512)
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", &off_100253950, CFSTR("AP_MODE_AUTH_LOWER"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", &off_100253968, CFSTR("AP_MODE_AUTH_UPPER"));
      v18 = CFSTR("AP_MODE_CYPHER_TYPE");
      v19 = v15;
      v20 = &off_100253968;
LABEL_16:
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, v18);
    }
  }
  else
  {
    if (v16 == 16)
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", &off_100253950, CFSTR("AP_MODE_AUTH_LOWER"));
      v17 = &off_100253A10;
      goto LABEL_15;
    }
    if (v16 == 64)
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", &off_100253950, CFSTR("AP_MODE_AUTH_LOWER"));
      v17 = &off_100253A58;
LABEL_15:
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("AP_MODE_AUTH_UPPER"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", &off_100253A28, CFSTR("AP_MODE_CYPHER_TYPE"));
      v20 = (_UNKNOWN **)objc_msgSend(v10, "password");
      v18 = CFSTR("AP_MODE_KEY");
      v19 = v15;
      goto LABEL_16;
    }
  }
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1001525D8;
  aBlock[3] = &unk_1002324C8;
  aBlock[4] = a3;
  v21 = _Block_copy(aBlock);
  v22 = sub_10010F0C0(v14, v12, 2, v15, (uint64_t)sub_10014ADF4, (uint64_t)v21, objc_msgSend(a4, "processName"));
  if (!v22)
    return;
  v23 = (NSErrorDomain)CWFManagerErrorDomain;
  v24 = v22;
LABEL_22:
  v25 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v23, v24, 0);
  if (v25)
  {
    if (objc_msgSend(a3, "response"))
    {
      v26 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
      v26[2](v26, v25, 0);
    }

  }
}

- (void)__stopHostAPMode:(id)a3 XPCConnection:(id)a4
{
  id v6;
  id v7;
  const void *v8;
  __WiFiDeviceManager *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSErrorDomain v13;
  uint64_t v14;
  NSError *v15;
  void (**v16)(id, NSError *, _QWORD);
  _QWORD aBlock[5];

  v6 = a3;
  v7 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v7)
  {
    v8 = v7;
    v9 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v7);
    if (v9)
    {
      v10 = (uint64_t)v9;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1001527A0;
      aBlock[3] = &unk_1002324F0;
      aBlock[4] = a3;
      v11 = _Block_copy(aBlock);
      v12 = sub_10010F988(v10, v8, 2, (uint64_t)sub_10014B100, (uint64_t)v11);
      if (!v12)
        return;
      v13 = (NSErrorDomain)CWFManagerErrorDomain;
      v14 = v12;
    }
    else
    {
      v13 = NSPOSIXErrorDomain;
      v14 = 6;
    }
  }
  else
  {
    v13 = NSPOSIXErrorDomain;
    v14 = 22;
  }
  v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, v14, 0);
  if (v15)
  {
    if (objc_msgSend(a3, "response"))
    {
      v16 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
      v16[2](v16, v15, 0);
    }

  }
}

- (void)__getWiFiAssistOverrideReasons:(id)a3
{
  NSObject *mutexQueue;
  id v5;
  id v6;
  void (**v7)(id, _QWORD, id);
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_10002FAB8;
  v13 = sub_10002F9B0;
  v14 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100152934;
  block[3] = &unk_10022F2E8;
  block[5] = a3;
  block[6] = &v9;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v6 = (id)v10[5];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CWFXPCResultKey);
  if (objc_msgSend(a3, "response"))
  {
    v7 = (void (**)(id, _QWORD, id))objc_msgSend(a3, "response");
    v7[2](v7, 0, v5);
  }
  _Block_object_dispose(&v9, 8);
}

- (void)__getBackgroundScanConfiguration:(id)a3
{
  id v5;
  __WiFiDeviceManager *v6;
  id v7;
  id v8;
  _QWORD *v9;
  id v10;
  void (*v11)(_QWORD *, NSError *, id);
  _QWORD *v12;
  NSError *v13;
  uint64_t v14;
  NSError *v15;
  NSError *v16;

  v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      v7 = sub_100123BD4((uint64_t)v6);
      goto LABEL_4;
    }
    v14 = 6;
  }
  else
  {
    v14 = 22;
  }
  v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v14, 0);
  if (!v15)
  {
    v7 = 0;
LABEL_4:
    v8 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CWFXPCResultKey);
    if (objc_msgSend(a3, "response"))
    {
      v9 = objc_msgSend(a3, "response");
      v10 = objc_msgSend(v8, "copy");
      v11 = (void (*)(_QWORD *, NSError *, id))v9[2];
      v12 = v9;
      v13 = 0;
LABEL_6:
      v11(v12, v13, v10);
      return;
    }
    return;
  }
  v16 = v15;
  if (objc_msgSend(a3, "response"))
  {
    v12 = objc_msgSend(a3, "response");
    v11 = (void (*)(_QWORD *, NSError *, id))v12[2];
    v13 = v16;
    v10 = 0;
    goto LABEL_6;
  }
}

- (void)__setBackgroundScanConfiguration:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  const void *v9;
  __WiFiDeviceManager *v10;
  int v11;
  NSError *v12;
  void (**v13)(id, NSError *, _QWORD);
  NSErrorDomain v14;
  uint64_t v15;

  v5 = objc_msgSend(a3, "info");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCBackgroundScanConfigurationKey);
  if (v6 && (v7 = v6, (v8 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) != 0))
  {
    v9 = v8;
    v10 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v8);
    if (v10)
    {
      v11 = sub_100123590((uint64_t *)v10, v9, v7);
      if (!v11)
      {
        v12 = 0;
        goto LABEL_6;
      }
      v14 = (NSErrorDomain)CWFManagerErrorDomain;
      v15 = v11;
    }
    else
    {
      v14 = NSPOSIXErrorDomain;
      v15 = 6;
    }
  }
  else
  {
    v14 = NSPOSIXErrorDomain;
    v15 = 22;
  }
  v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v14, v15, 0);
LABEL_6:
  if (objc_msgSend(a3, "response"))
  {
    v13 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a3, "response");
    v13[2](v13, v12, 0);
  }
}

- (void)__getAutoJoinDenyList:(id)a3
{
  id v5;
  __WiFiDeviceManager *v6;
  NSMutableArray *v7;
  id v8;
  _QWORD *v9;
  id v10;
  void (*v11)(_QWORD *, NSError *, id);
  _QWORD *v12;
  NSError *v13;
  uint64_t v14;
  NSError *v15;
  NSError *v16;

  v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      v7 = sub_100124020((uint64_t)v6);
      goto LABEL_4;
    }
    v14 = 6;
  }
  else
  {
    v14 = 22;
  }
  v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v14, 0);
  if (!v15)
  {
    v7 = 0;
LABEL_4:
    v8 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CWFXPCResultKey);
    if (objc_msgSend(a3, "response"))
    {
      v9 = objc_msgSend(a3, "response");
      v10 = objc_msgSend(v8, "copy");
      v11 = (void (*)(_QWORD *, NSError *, id))v9[2];
      v12 = v9;
      v13 = 0;
LABEL_6:
      v11(v12, v13, v10);
      return;
    }
    return;
  }
  v16 = v15;
  if (objc_msgSend(a3, "response"))
  {
    v12 = objc_msgSend(a3, "response");
    v11 = (void (*)(_QWORD *, NSError *, id))v12[2];
    v13 = v16;
    v10 = 0;
    goto LABEL_6;
  }
}

- (void)__setAutoJoinDenyList:(id)a3
{
  id v5;
  __WiFiDeviceManager *v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  id v10;
  _WORD *v11;
  void *v12;
  NSMutableArray *v13;
  id v14;
  _QWORD *v15;
  id v16;
  void (*v17)(_QWORD *, NSError *, id);
  _QWORD *v18;
  NSError *v19;
  uint64_t v20;
  NSError *v21;
  NSError *v22;

  v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      v7 = (uint64_t)v6;
      v8 = objc_msgSend(a3, "info");
      v9 = (int)objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CWFAutoJoinDenyListAddReasonKey), "intValue");
      v10 = objc_msgSend(a3, "info");
      v11 = sub_1000CCB10(objc_msgSend(v10, "objectForKeyedSubscript:", CWFXPCNetworkProfileKey), 0);
      if (!sub_1001241D0(v7, v9, (uint64_t)v11))
      {
        v12 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s - WiFiDeviceManagerSetAutoJoinDenylistedNetwork %lu failed", "-[WiFiXPCManager __setAutoJoinDenyList:]", v9);
        objc_autoreleasePoolPop(v12);
      }
      v13 = sub_100124020(v7);
LABEL_8:
      v14 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CWFXPCResultKey);
      if (objc_msgSend(a3, "response"))
      {
        v15 = objc_msgSend(a3, "response");
        v16 = objc_msgSend(v14, "copy");
        v17 = (void (*)(_QWORD *, NSError *, id))v15[2];
        v18 = v15;
        v19 = 0;
LABEL_10:
        v17(v18, v19, v16);
        return;
      }
      return;
    }
    v20 = 6;
  }
  else
  {
    v20 = 22;
  }
  v21 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v20, 0);
  if (!v21)
  {
    v13 = 0;
    goto LABEL_8;
  }
  v22 = v21;
  if (objc_msgSend(a3, "response"))
  {
    v18 = objc_msgSend(a3, "response");
    v17 = (void (*)(_QWORD *, NSError *, id))v18[2];
    v19 = v22;
    v16 = 0;
    goto LABEL_10;
  }
}

- (void)__clearAutoJoinDenyList:(id)a3
{
  id v5;
  __WiFiDeviceManager *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _WORD *v11;
  void *v12;
  NSMutableArray *v13;
  id v14;
  _QWORD *v15;
  id v16;
  void (*v17)(_QWORD *, NSError *, id);
  _QWORD *v18;
  NSError *v19;
  uint64_t v20;
  NSError *v21;
  NSError *v22;

  v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      v7 = (uint64_t)v6;
      v8 = objc_msgSend(a3, "info");
      v9 = (int)objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CWFAutoJoinDenyListRemoveReasonKey), "intValue");
      v10 = objc_msgSend(a3, "info");
      v11 = sub_1000CCB10(objc_msgSend(v10, "objectForKeyedSubscript:", CWFXPCNetworkProfileKey), 0);
      if ((sub_1001241EC(v7, v9, (uint64_t)v11) & 1) == 0)
      {
        v12 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s - WiFiDeviceManagerClearAutoJoinDenylistedNetwork %lu failed", "-[WiFiXPCManager __clearAutoJoinDenyList:]", v9);
        objc_autoreleasePoolPop(v12);
      }
      v13 = sub_100124020(v7);
LABEL_8:
      v14 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CWFXPCResultKey);
      if (objc_msgSend(a3, "response"))
      {
        v15 = objc_msgSend(a3, "response");
        v16 = objc_msgSend(v14, "copy");
        v17 = (void (*)(_QWORD *, NSError *, id))v15[2];
        v18 = v15;
        v19 = 0;
LABEL_10:
        v17(v18, v19, v16);
        return;
      }
      return;
    }
    v20 = 6;
  }
  else
  {
    v20 = 22;
  }
  v21 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v20, 0);
  if (!v21)
  {
    v13 = 0;
    goto LABEL_8;
  }
  v22 = v21;
  if (objc_msgSend(a3, "response"))
  {
    v18 = objc_msgSend(a3, "response");
    v17 = (void (*)(_QWORD *, NSError *, id))v18[2];
    v19 = v22;
    v16 = 0;
    goto LABEL_10;
  }
}

- (id)__queueForRequest:(id)a3
{
  id v5;

  if ((char *)objc_msgSend(a3, "type") - 57 > (char *)1)
    return (id)sub_100031A60((uint64_t)self->_managerRef);
  v5 = objc_msgSend(a3, "info");
  if (objc_msgSend(objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCForceNoCacheKey), "BOOLValue"))
    return (id)sub_100031A60((uint64_t)self->_managerRef);
  else
    return self->_currentNetworkQueue;
}

- (void)XPCManager:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5
{
  void *v8;
  NSObject *v9;
  NSObject *v10;
  qos_class_t v11;
  dispatch_block_t v12;
  void (**v13)(id, NSError *, _QWORD);
  _QWORD block[7];

  v8 = objc_autoreleasePoolPush();
  v9 = -[WiFiXPCManager __queueForRequest:](self, "__queueForRequest:", a5);
  if (v9)
  {
    v10 = v9;
    v11 = qos_class_self();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001531BC;
    block[3] = &unk_100232518;
    block[4] = a5;
    block[5] = self;
    block[6] = a4;
    v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v11, 0, block);
    dispatch_async(v10, v12);
    _Block_release(v12);
  }
  else if (objc_msgSend(a5, "response"))
  {
    v13 = (void (**)(id, NSError *, _QWORD))objc_msgSend(a5, "response");
    v13[2](v13, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 6, 0), 0);
  }
  objc_autoreleasePoolPop(v8);
}

@end
