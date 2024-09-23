@implementation BAAgentDownloadRulesEngine

- (BAAgentDownloadRulesEngine)initWithDelegate:(id)a3
{
  id v4;
  BAAgentDownloadRulesEngine *v5;
  BAAgentDownloadRulesEngine *v6;
  dispatch_queue_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BAAgentDownloadRulesEngine;
  v5 = -[BAAgentDownloadRulesEngine init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[BAAgentDownloadRulesEngine setDelegate:](v5, "setDelegate:", v4);
    v7 = dispatch_queue_create("com.apple.backgroundassets.rulesengine", 0);
    -[BAAgentDownloadRulesEngine setRulesEngineWorkQueue:](v6, "setRulesEngineWorkQueue:", v7);

    -[BAAgentDownloadRulesEngine setLastDownloadIsValidValue:](v6, "setLastDownloadIsValidValue:", -[BAAgentDownloadRulesEngine isValidTimeForDownloads](v6, "isValidTimeForDownloads"));
  }

  return v6;
}

- (void)dealloc
{
  __CFRunLoop *Main;
  objc_super v4;

  if (-[BAAgentDownloadRulesEngine powerRunLoopSource](self, "powerRunLoopSource"))
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, -[BAAgentDownloadRulesEngine powerRunLoopSource](self, "powerRunLoopSource"), kCFRunLoopCommonModes);
    CFRelease(self->_powerRunLoopSource);
    -[BAAgentDownloadRulesEngine setPowerRunLoopSource:](self, "setPowerRunLoopSource:", 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)BAAgentDownloadRulesEngine;
  -[BAAgentDownloadRulesEngine dealloc](&v4, "dealloc");
}

- (void)setDebugValidityTimeOverride:(int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  v5 = objc_claimAutoreleasedReturnValue(-[BAAgentDownloadRulesEngine rulesEngineWorkQueue](self, "rulesEngineWorkQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002789C;
  v6[3] = &unk_100059640;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (BOOL)isValidTimeForDownloads
{
  _BOOL8 v3;

  if (-[BAAgentDownloadRulesEngine debugRuleValidity](self, "debugRuleValidity"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[BAAgentDownloadRulesEngine isConnectedToPower](self, "isConnectedToPower");
    -[BAAgentDownloadRulesEngine setLastDownloadIsValidValue:](self, "setLastDownloadIsValidValue:", v3);
  }
  return v3;
}

- (BOOL)isConnectedToPower
{
  CFTypeRef v2;
  const void *v3;
  const __CFArray *v4;
  CFIndex i;
  CFIndex Count;
  BOOL v7;
  const void *ValueAtIndex;
  const __CFDictionary *v9;
  const void *Value;
  id v11;
  NSObject *v12;
  uint8_t v14[16];

  v2 = IOPSCopyPowerSourcesInfo();
  v3 = v2;
  if (v2)
  {
    v4 = IOPSCopyPowerSourcesList(v2);
    for (i = 0; ; ++i)
    {
      Count = CFArrayGetCount(v4);
      v7 = i < Count;
      if (i >= Count)
        break;
      ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
      v9 = IOPSGetPowerSourceDescription(v3, ValueAtIndex);
      if (v9)
      {
        Value = CFDictionaryGetValue(v9, CFSTR("Power Source State"));
        if (Value)
        {
          if (CFEqual(CFSTR("AC Power"), Value))
            break;
        }
      }
    }
    CFRelease(v3);
    if (v4)
      CFRelease(v4);
  }
  else
  {
    v11 = sub_1000128F4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Failed to get power sources. Assume connected to power.", v14, 2u);
    }

    return 1;
  }
  return v7;
}

- (float)batteryLevel
{
  CFTypeRef v2;
  const void *v3;
  const __CFArray *v4;
  CFIndex v5;
  float v6;
  const void *ValueAtIndex;
  const __CFDictionary *v8;
  const __CFNumber *Value;
  const __CFNumber *v10;
  CFTypeID v11;
  id v12;
  NSObject *v13;
  float valuePtr;
  uint8_t buf[16];

  v2 = IOPSCopyPowerSourcesInfo();
  v3 = v2;
  if (v2)
  {
    v4 = IOPSCopyPowerSourcesList(v2);
    v5 = 0;
    v6 = 0.0;
    while (v5 < CFArrayGetCount(v4))
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v4, v5);
      v8 = IOPSGetPowerSourceDescription(v3, ValueAtIndex);
      if (v8)
      {
        Value = (const __CFNumber *)CFDictionaryGetValue(v8, CFSTR("Current Capacity"));
        v10 = Value;
        if (Value)
        {
          v11 = CFGetTypeID(Value);
          if (v11 == CFNumberGetTypeID())
          {
            valuePtr = 0.0;
            CFNumberGetValue(v10, kCFNumberFloatType, &valuePtr);
            if (valuePtr > v6)
              v6 = valuePtr;
          }
        }
      }
      ++v5;
    }
    CFRelease(v3);
    if (v4)
      CFRelease(v4);
  }
  else
  {
    v12 = sub_1000128F4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Failed to get power sources. Assume full battery.", buf, 2u);
    }

    return 100.0;
  }
  return v6;
}

- (void)resume
{
  -[BAAgentDownloadRulesEngine _setupXPCActivity](self, "_setupXPCActivity");
  -[BAAgentDownloadRulesEngine _setupPowerSourceMonitor](self, "_setupPowerSourceMonitor");
}

- (void)_setupPowerSourceMonitor
{
  __CFRunLoop *Main;

  -[BAAgentDownloadRulesEngine setPowerRunLoopSource:](self, "setPowerRunLoopSource:", IOPSNotificationCreateRunLoopSource((IOPowerSourceCallbackType)j__objc_msgSend__powerSourceHasChanged, self));
  if (-[BAAgentDownloadRulesEngine powerRunLoopSource](self, "powerRunLoopSource"))
  {
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, -[BAAgentDownloadRulesEngine powerRunLoopSource](self, "powerRunLoopSource"), kCFRunLoopCommonModes);
  }
}

- (void)_setupXPCActivity
{
  xpc_object_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, 14400);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100027EA8;
  v4[3] = &unk_100059668;
  objc_copyWeak(&v5, &location);
  xpc_activity_register("com.apple.backgroundassets.periodic_check", v3, v4);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", 0, &stru_1000596A8);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

- (void)_powerSourceHasChanged
{
  unsigned int v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = -[BAAgentDownloadRulesEngine lastDownloadIsValidValue](self, "lastDownloadIsValidValue");
  if (v3 != -[BAAgentDownloadRulesEngine isValidTimeForDownloads](self, "isValidTimeForDownloads"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[BAAgentDownloadRulesEngine rulesEngineWorkQueue](self, "rulesEngineWorkQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028120;
    block[3] = &unk_100058998;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

- (BAAgentDownloadRulesEngineDelegate)delegate
{
  return (BAAgentDownloadRulesEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)networkingIsCheap
{
  return self->_networkingIsCheap;
}

- (void)setNetworkingIsCheap:(BOOL)a3
{
  self->_networkingIsCheap = a3;
}

- (__CFRunLoopSource)powerRunLoopSource
{
  return self->_powerRunLoopSource;
}

- (void)setPowerRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_powerRunLoopSource = a3;
}

- (BOOL)lastDownloadIsValidValue
{
  return self->_lastDownloadIsValidValue;
}

- (void)setLastDownloadIsValidValue:(BOOL)a3
{
  self->_lastDownloadIsValidValue = a3;
}

- (OS_dispatch_queue)rulesEngineWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRulesEngineWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)debugRuleValidity
{
  return self->_debugRuleValidity;
}

- (void)setDebugRuleValidity:(int)a3
{
  self->_debugRuleValidity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rulesEngineWorkQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
