@implementation WiFiAppStateManager

- (void)_setApplicationState:(__CFString *)a3 active:(BOOL)a4 underLock:(BOOL)a5 capabilities:(int)a6
{
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v11;
  unsigned int v12;
  __CFSet *activeApplications;
  unsigned __int8 Count;
  unsigned __int8 v15;
  __CFSet *v16;
  __CFSet *backgroundApplications;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  CFTypeRef v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *queue;
  void *v29;
  void *v30;
  _QWORD block[6];
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[5];
  int v38;
  _QWORD v39[5];
  unsigned int v40;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v8 = a4;
  v11 = sub_100031E10(a3);
  if (!a3)
  {
    v29 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null bundleID", "-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]");
    goto LABEL_46;
  }
  v12 = v11;
  activeApplications = self->_activeApplications;
  if (!activeApplications)
  {
    v29 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null active applications", "-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]");
    goto LABEL_46;
  }
  if (!self->_backgroundApplications)
  {
    v29 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null background applications", "-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]");
    goto LABEL_46;
  }
  if (!v12)
  {
    v12 = -[WiFiUserInteractionMonitor hasRealTimeAppProperty:](+[WiFiUserInteractionMonitor sharedInstance](WiFiUserInteractionMonitor, "sharedInstance"), "hasRealTimeAppProperty:", a3);
    activeApplications = self->_activeApplications;
  }
  Count = CFSetGetCount(activeApplications);
  v15 = CFSetGetCount(self->_backgroundApplications);
  v16 = self->_activeApplications;
  if (v8)
  {
    CFSetAddValue(v16, a3);
    backgroundApplications = self->_backgroundApplications;
LABEL_10:
    CFSetRemoveValue(backgroundApplications, a3);
    goto LABEL_12;
  }
  CFSetRemoveValue(v16, a3);
  v18 = -[WiFiAppStateManager _appUsesBackgroundNetwork:](self, "_appUsesBackgroundNetwork:", v6);
  backgroundApplications = self->_backgroundApplications;
  if ((v18 & 1) == 0 && !v7)
    goto LABEL_10;
  CFSetAddValue(backgroundApplications, a3);
LABEL_12:
  v19 = CFSetGetCount(self->_activeApplications);
  v20 = CFSetGetCount(self->_backgroundApplications);
  v21 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s %d bgBefore=%d bgAfter=%d fgBefore=%d fgAfter=%d", "-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]", 401, v15, v20, Count, v19);
  objc_autoreleasePoolPop(v21);
  if (Count != v19)
  {
    if (Count >= v19)
    {
      -[WiFiAppStateManager setAppInForeground:](self, "setAppInForeground:", 0);
      queue = self->_queue;
      if (queue)
      {
        v22 = 2;
        if (self->_appReporterCallbackFunction && v12)
        {
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_100153D3C;
          v37[3] = &unk_100232600;
          v38 = 0;
          v37[4] = self;
          dispatch_async(queue, v37);
          v22 = 2;
        }
        goto LABEL_16;
      }
    }
    else
    {
      -[WiFiAppStateManager setAppInForeground:](self, "setAppInForeground:", 1);
      v27 = self->_queue;
      if (v27)
      {
        v22 = 1;
        if (self->_appReporterCallbackFunction && v12)
        {
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_100153CE8;
          v39[3] = &unk_100232600;
          v40 = v12;
          v39[4] = self;
          dispatch_async(v27, v39);
          v22 = 1;
        }
        goto LABEL_16;
      }
    }
    v29 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Nil queue", "-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]");
LABEL_46:
    objc_autoreleasePoolPop(v29);
    return;
  }
  v22 = 0;
LABEL_16:
  if (v15 >= v20)
    v23 = 8;
  else
    v23 = 4;
  if (v15 == v20)
    v24 = v22;
  else
    v24 = v23;
  if (self->_queue)
  {
    if (self->_callbackFunction)
    {
      v33 = 0;
      v34 = &v33;
      v35 = 0x2020000000;
      v36 = 0;
      v25 = CFRetain(a3);
      v34[3] = (uint64_t)v25;
      v26 = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100030DE8;
      block[3] = &unk_100232628;
      v32 = v24;
      block[4] = self;
      block[5] = &v33;
      dispatch_async(v26, block);
      _Block_object_dispose(&v33, 8);
    }
  }
  else
  {
    v30 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: No queue", "-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]");
    objc_autoreleasePoolPop(v30);
  }
}

- (void)_applicationStateMonitorHandler:(__CFDictionary *)a3
{
  BOOL v5;
  const void *v6;
  __CFDictionary *applications;
  uint64_t v8;
  unsigned int v9;
  CFTypeRef v10;
  NSObject *queue;
  NSObject *v12;
  unsigned int v13;
  NSMutableArray *v14;
  NSObject *v15;
  _QWORD *v16;
  NSMutableArray *foregroundAppBundleIDs;
  id v18;
  void *v19;
  _QWORD v20[6];
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  id v25;
  _QWORD v26[6];
  unsigned int v27;
  _QWORD block[6];
  unsigned int v29;
  BOOL v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  unsigned int v38;
  void *v39;
  unsigned int v40;
  void *v41;
  unsigned int valuePtr;
  void *value;

  value = 0;
  valuePtr = 0;
  v41 = 0;
  v40 = 0;
  v39 = 0;
  v38 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = sub_10002FAC8;
  v36 = sub_10002F9BC;
  v37 = 0;
  if (!a3)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null userInfo", "-[WiFiAppStateManager _applicationStateMonitorHandler:]");
    goto LABEL_57;
  }
  if (!self->_queue)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Nil queue", "-[WiFiAppStateManager _applicationStateMonitorHandler:]");
    goto LABEL_57;
  }
  if (CFDictionaryGetValueIfPresent(a3, BKSApplicationStateProcessIDKey, (const void **)&value))
    v5 = value == 0;
  else
    v5 = 1;
  if (!v5)
    CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
  if (!valuePtr)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: pidForStateChange(%d)", "-[WiFiAppStateManager _applicationStateMonitorHandler:]", valuePtr);
    goto LABEL_57;
  }
  v6 = CFDictionaryGetValue(a3, BKSApplicationStateDisplayIDKey);
  if (!v6)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null bundleID", "-[WiFiAppStateManager _applicationStateMonitorHandler:]");
    goto LABEL_57;
  }
  applications = self->_applications;
  if (!applications)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null applications", "-[WiFiAppStateManager _applicationStateMonitorHandler:]");
    goto LABEL_57;
  }
  if (CFDictionaryGetValueIfPresent(applications, v6, (const void **)&v41))
  {
    if (v41)
      CFNumberGetValue((CFNumberRef)v41, kCFNumberIntType, &v40);
  }
  else
  {
    v8 = -[WiFiAppStateManager _getAppCapabilitiesForBundleID:](self, "_getAppCapabilitiesForBundleID:", valuePtr);
    v40 = v8;
    -[WiFiAppStateManager _registerApplication:capabilities:](self, "_registerApplication:capabilities:", v6, v8);
  }
  if (!CFDictionaryGetValueIfPresent(a3, BKSApplicationStateKey, (const void **)&v39))
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Null BKSApplicationStateKey", "-[WiFiAppStateManager _applicationStateMonitorHandler:]");
LABEL_57:
    objc_autoreleasePoolPop(v19);
    goto LABEL_44;
  }
  CFNumberGetValue((CFNumberRef)v39, kCFNumberIntType, &v38);
  v9 = v38;
  v10 = CFRetain(v6);
  v33[5] = (uint64_t)v10;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FAC8;
  block[3] = &unk_1002325B0;
  v30 = v9 != 1;
  v31 = v9 == 8;
  v29 = v40;
  block[4] = self;
  block[5] = &v32;
  dispatch_async(queue, block);
  if (-[WiFiAppStateManager _appUsesWiFiNetwork:](self, "_appUsesWiFiNetwork:", v40)
    || -[WiFiUserInteractionMonitor hasRealTimeAppProperty:](+[WiFiUserInteractionMonitor sharedInstance](WiFiUserInteractionMonitor, "sharedInstance"), "hasRealTimeAppProperty:", v6))
  {
    -[WiFiAppStateManager _appStateChanged:bundleID:capabilities:](self, "_appStateChanged:bundleID:capabilities:", v38, v6, v40);
  }
  if (-[WiFiAppStateManager _isMonitoringChangesForBundleID:](self, "_isMonitoringChangesForBundleID:", v6)
    && self->_bundleCallbackFunction)
  {
    v12 = self->_queue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100030E8C;
    v26[3] = &unk_1002325D8;
    v26[4] = self;
    v26[5] = v6;
    v27 = v38;
    dispatch_async(v12, v26);
  }
  v13 = v38;
  if (v38 == 1)
  {
    -[WiFiAppStateManager _unRegisterApplication:](self, "_unRegisterApplication:", v6);
    v13 = v38;
  }
  if (v13 - 1 < 2 || v13 == 4)
  {
    foregroundAppBundleIDs = self->_foregroundAppBundleIDs;
    if (foregroundAppBundleIDs)
    {
      if (-[NSMutableArray containsObject:](foregroundAppBundleIDs, "containsObject:", v6))
      {
        -[NSMutableArray removeObject:](self->_foregroundAppBundleIDs, "removeObject:", v6);
        if (self->_fgAppTrackerCallbackContext)
        {
          if (self->_fgAppTrackerCallbackFunction && self->_queue)
          {
            v22 = 0;
            v23 = &v22;
            v24 = 0x2020000000;
            v25 = 0;
            if (-[NSMutableArray count](self->_foregroundAppBundleIDs, "count"))
            {
              v18 = objc_msgSend(-[NSMutableArray lastObject](self->_foregroundAppBundleIDs, "lastObject"), "copy");
              v23[3] = (uint64_t)v18;
            }
            v15 = self->_queue;
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_100030E3C;
            v20[3] = &unk_100232588;
            v20[4] = self;
            v20[5] = &v22;
            v16 = v20;
            goto LABEL_43;
          }
        }
      }
    }
  }
  else if (v13 == 8)
  {
    v14 = self->_foregroundAppBundleIDs;
    if (v14
      || (v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray),
          (self->_foregroundAppBundleIDs = v14) != 0))
    {
      if ((-[NSMutableArray containsObject:](v14, "containsObject:", v6) & 1) == 0)
        -[NSMutableArray addObject:](self->_foregroundAppBundleIDs, "addObject:", v6);
    }
    if (self->_fgAppTrackerCallbackContext && self->_fgAppTrackerCallbackFunction && self->_queue)
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = (id)0xAAAAAAAAAAAAAAAALL;
      v25 = objc_msgSend(-[NSMutableArray lastObject](self->_foregroundAppBundleIDs, "lastObject"), "copy");
      v15 = self->_queue;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000FF08;
      v21[3] = &unk_100232588;
      v21[4] = self;
      v21[5] = &v22;
      v16 = v21;
LABEL_43:
      dispatch_async(v15, v16);
      _Block_object_dispose(&v22, 8);
    }
  }
LABEL_44:
  _Block_object_dispose(&v32, 8);
}

- (BOOL)_appUsesWiFiNetwork:(int)a3
{
  return (a3 & 6) != 0;
}

- (BOOL)_isMonitoringChangesForBundleID:(__CFString *)a3
{
  const __CFSet *bundleIdsToMonitor;

  if (a3)
  {
    bundleIdsToMonitor = self->_bundleIdsToMonitor;
    if (bundleIdsToMonitor)
    {
      bundleIdsToMonitor = (const __CFSet *)CFSetGetCount(bundleIdsToMonitor);
      if (bundleIdsToMonitor)
        LOBYTE(bundleIdsToMonitor) = CFSetContainsValue(self->_bundleIdsToMonitor, a3) != 0;
    }
  }
  else
  {
    LOBYTE(bundleIdsToMonitor) = 0;
  }
  return (char)bundleIdsToMonitor;
}

- (void)_registerApplication:(__CFString *)a3 capabilities:(int)a4
{
  CFNumberRef v6;
  CFNumberRef v7;
  __CFDictionary *applications;
  void *v9;
  void *v10;
  void *v11;
  int valuePtr;

  valuePtr = a4;
  if (a3)
  {
    v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v6)
    {
      v7 = v6;
      applications = self->_applications;
      if (applications)
      {
        CFDictionaryAddValue(applications, a3, v7);
      }
      else
      {
        v11 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _applications", "-[WiFiAppStateManager _registerApplication:capabilities:]");
        objc_autoreleasePoolPop(v11);
      }
      CFRelease(v7);
    }
    else
    {
      v10 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null capabilitiesRef", "-[WiFiAppStateManager _registerApplication:capabilities:]");
      objc_autoreleasePoolPop(v10);
    }
  }
  else
  {
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null bundleID", "-[WiFiAppStateManager _registerApplication:capabilities:]");
    objc_autoreleasePoolPop(v9);
  }
}

- (int)_getAppCapabilitiesForBundleID:(int)a3
{
  BKSApplicationStateMonitor *applicationStateMonitor;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v12;

  applicationStateMonitor = self->_applicationStateMonitor;
  if (applicationStateMonitor)
  {
    v5 = *(_QWORD *)&a3;
    v6 = -[BKSApplicationStateMonitor bundleInfoValueForKey:PID:](applicationStateMonitor, "bundleInfoValueForKey:PID:", CFSTR("SBUsesNetwork"), *(_QWORD *)&a3);
    if (v6)
    {
      v7 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        LODWORD(v6) = objc_msgSend(v6, "unsignedIntValue");
      else
        LODWORD(v6) = 0;
    }
    v8 = -[BKSApplicationStateMonitor bundleInfoValueForKey:PID:](self->_applicationStateMonitor, "bundleInfoValueForKey:PID:", CFSTR("UIRequiresPersistentWiFi"), v5);
    if (v8)
    {
      v9 = v8;
      v10 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      {
        if (objc_msgSend(v9, "BOOLValue"))
          LODWORD(v6) = v6 | 2;
      }
    }
  }
  else
  {
    v12 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _applicationStateMonitor", "-[WiFiAppStateManager _getAppCapabilitiesForBundleID:]");
    objc_autoreleasePoolPop(v12);
    LODWORD(v6) = 0;
  }
  return (int)v6;
}

- (void)setAppInForeground:(BOOL)a3
{
  self->_appInForeground = a3;
}

- (void)_appStateChanged:(unsigned int)a3 bundleID:(__CFString *)a4 capabilities:(int)a5
{
  __CFString *v5;
  uint64_t v6;
  void *v7;

  if (a4)
  {
    switch(a3)
    {
      case 1u:
      case 2u:
      case 4u:
        v5 = a4;
        v6 = 0;
        goto LABEL_5;
      case 8u:
        v5 = a4;
        v6 = 1;
LABEL_5:
        -[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:](self, "_setApplicationState:active:underLock:capabilities:", v5, v6, 0, *(_QWORD *)&a5);
        break;
      default:
        return;
    }
  }
  else
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null bundleID", "-[WiFiAppStateManager _appStateChanged:bundleID:capabilities:]");
    objc_autoreleasePoolPop(v7);
  }
}

+ (id)sharedWiFiAppStateManager
{
  if (qword_10026DBA0 != -1)
    dispatch_once(&qword_10026DBA0, &stru_100232538);
  return (id)qword_10026DB98;
}

- (void)scheduleWithQueue:(id)a3
{
  __CFNotificationCenter *DistributedCenter;

  self->_queue = (OS_dispatch_queue *)a3;
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(DistributedCenter, self, (CFNotificationCallback)sub_100153758, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)unscheduleFromQueue:(id)a3
{
  __CFNotificationCenter *DistributedCenter;

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
  self->_queue = 0;
}

- (WiFiAppStateManager)init
{
  WiFiAppStateManager *v2;
  CFMutableDictionaryRef Mutable;
  CFMutableSetRef v4;
  CFMutableSetRef v5;
  CFMutableSetRef v6;
  BKSApplicationStateMonitor *v7;
  CFMutableSetRef v8;
  BKSApplicationStateMonitor *applicationStateMonitor;
  void *v11;
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WiFiAppStateManager;
  v2 = -[WiFiAppStateManager init](&v13, "init");
  if (!v2)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed in super-init", "-[WiFiAppStateManager init]");
    goto LABEL_25;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v2->_applications = Mutable;
  if (!Mutable)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _applications", "-[WiFiAppStateManager init]");
    goto LABEL_25;
  }
  v4 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  v2->_activeApplications = v4;
  if (!v4)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _activeApplications", "-[WiFiAppStateManager init]");
    goto LABEL_25;
  }
  v5 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  v2->_backgroundApplications = v5;
  if (!v5)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _backgroundApplications", "-[WiFiAppStateManager init]");
    goto LABEL_25;
  }
  v6 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  v2->_appsInForeground = v6;
  if (!v6)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _appsInForeground", "-[WiFiAppStateManager init]");
    goto LABEL_25;
  }
  if (!objc_opt_class(BKSApplicationStateMonitor))
  {
LABEL_26:

    return 0;
  }
  v7 = (BKSApplicationStateMonitor *)objc_msgSend(objc_alloc((Class)BKSApplicationStateMonitor), "initWithBundleIDs:states:", 0, 9);
  v2->_applicationStateMonitor = v7;
  if (!v7)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _applicationStateMonitor", "-[WiFiAppStateManager init]");
    goto LABEL_25;
  }
  v8 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  v2->_bundleIdsToMonitor = v8;
  if (!v8)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _bundleIdsToMonitor", "-[WiFiAppStateManager init]");
LABEL_25:
    objc_autoreleasePoolPop(v11);
    goto LABEL_26;
  }
  applicationStateMonitor = v2->_applicationStateMonitor;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009F30;
  v12[3] = &unk_100232560;
  v12[4] = v2;
  -[BKSApplicationStateMonitor setHandler:](applicationStateMonitor, "setHandler:", v12);
  return v2;
}

- (void)externalAppUnregistered:(__CFDictionary *)a3
{
  NSObject *queue;
  _QWORD v5[6];
  _QWORD v6[3];
  CFTypeRef v7;

  if (self->_unregisteredCallbackContext && a3 && self->_unregisteredCallbackFunction)
  {
    if (self->_queue)
    {
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x2020000000;
      v7 = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      v7 = CFRetain(a3);
      queue = self->_queue;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100153B14;
      v5[3] = &unk_100232588;
      v5[4] = self;
      v5[5] = v6;
      dispatch_async(queue, v5);
      _Block_object_dispose(v6, 8);
    }
  }
}

- (void)dealloc
{
  __CFDictionary *applications;
  __CFSet *activeApplications;
  __CFSet *backgroundApplications;
  __CFSet *appsInForeground;
  __CFSet *bundleIdsToMonitor;
  BKSApplicationStateMonitor *applicationStateMonitor;
  BKSApplicationStateMonitor *v9;
  objc_super v10;

  applications = self->_applications;
  if (applications)
  {
    CFRelease(applications);
    self->_applications = 0;
  }
  activeApplications = self->_activeApplications;
  if (activeApplications)
  {
    CFRelease(activeApplications);
    self->_activeApplications = 0;
  }
  backgroundApplications = self->_backgroundApplications;
  if (backgroundApplications)
  {
    CFRelease(backgroundApplications);
    self->_backgroundApplications = 0;
  }
  appsInForeground = self->_appsInForeground;
  if (appsInForeground)
  {
    CFRelease(appsInForeground);
    self->_appsInForeground = 0;
  }
  bundleIdsToMonitor = self->_bundleIdsToMonitor;
  if (bundleIdsToMonitor)
  {
    CFRelease(bundleIdsToMonitor);
    self->_bundleIdsToMonitor = 0;
  }
  applicationStateMonitor = self->_applicationStateMonitor;
  if (applicationStateMonitor)
  {
    -[BKSApplicationStateMonitor invalidate](applicationStateMonitor, "invalidate");
    v9 = self->_applicationStateMonitor;
    if (v9)
    {
      CFRelease(v9);
      self->_applicationStateMonitor = 0;
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)WiFiAppStateManager;
  -[WiFiAppStateManager dealloc](&v10, "dealloc");
}

- (void)registerCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_callbackContext = a4;
  self->_callbackFunction = a3;
}

- (void)registerBundleCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_bundleCallbackContext = a4;
  self->_bundleCallbackFunction = a3;
}

- (void)registerAppUnregistrationFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_unregisteredCallbackContext = a4;
  self->_unregisteredCallbackFunction = a3;
}

- (void)registerForegroundAppTrackerFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_fgAppTrackerCallbackContext = a4;
  self->_fgAppTrackerCallbackFunction = a3;
}

- (void)registerAppReporterCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_appReporterCallbackContext = a4;
  self->_appReporterCallbackFunction = a3;
}

- (void)_unRegisterApplication:(__CFString *)a3
{
  __CFDictionary *applications;
  void *v4;

  if (a3)
  {
    applications = self->_applications;
    if (applications)
    {
      CFDictionaryRemoveValue(applications, a3);
      return;
    }
    v4 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _applications", "-[WiFiAppStateManager _unRegisterApplication:]");
  }
  else
  {
    v4 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null bundleID", "-[WiFiAppStateManager _unRegisterApplication:]");
  }
  objc_autoreleasePoolPop(v4);
}

- (id)_getStringOfAppState:(unsigned int)a3
{
  if (a3 - 1 > 7)
    return CFSTR("WiFiApplicationStateUnknown");
  else
    return off_100232648[a3 - 1];
}

- (BOOL)_appUsesBackgroundNetwork:(int)a3
{
  return (a3 >> 3) & 1;
}

- (void)startMonitoringBundleId:(__CFString *)a3
{
  __CFSet *bundleIdsToMonitor;

  if (a3)
  {
    bundleIdsToMonitor = self->_bundleIdsToMonitor;
    if (bundleIdsToMonitor)
      CFSetAddValue(bundleIdsToMonitor, a3);
  }
}

- (void)stopMonitoringBundleId:(__CFString *)a3
{
  __CFSet *bundleIdsToMonitor;

  if (a3)
  {
    bundleIdsToMonitor = self->_bundleIdsToMonitor;
    if (bundleIdsToMonitor)
      CFSetRemoveValue(bundleIdsToMonitor, a3);
  }
}

- (BOOL)appInForeground
{
  return self->_appInForeground;
}

@end
