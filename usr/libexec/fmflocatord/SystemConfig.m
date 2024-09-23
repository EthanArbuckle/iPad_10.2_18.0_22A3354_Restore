@implementation SystemConfig

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("DeviceNameMayHaveChangedNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("DeviceLocaleMayHaveChangedNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("LocationServicesStateChangedNotification"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("FMFLocationServicesStateChangedNotification"), 0);

  v7.receiver = self;
  v7.super_class = (Class)SystemConfig;
  -[SystemConfig dealloc](&v7, "dealloc");
}

+ (id)sharedInstance
{
  if (qword_100069618 != -1)
    dispatch_once(&qword_100069618, &stru_100055BF8);
  return (id)qword_100069610;
}

- (id)initSingleton
{
  SystemConfig *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SystemConfig;
  v2 = -[SystemConfig init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PreferencesMgr sharedInstance](PreferencesMgr, "sharedInstance"));
    -[SystemConfig setPreferencesMgr:](v2, "setPreferencesMgr:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "deviceNameMayNeedUpdate", CFSTR("DeviceNameMayHaveChangedNotification"), 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "localeMayNeedUpdate", CFSTR("DeviceLocaleMayHaveChangedNotification"), 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, "updateLocationState", CFSTR("LocationServicesStateChangedNotification"), 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "updateLocationState", CFSTR("FMFLocationServicesStateChangedNotification"), 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10001B2B8, CFSTR("com.apple.system.timezone"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)updateLocationState
{
  -[SystemConfig set_currentLocationServicesState:](self, "set_currentLocationServicesState:", 0);
}

- (void)_handleGestaltError:(int)a3 forKey:(__CFString *)a4
{
  id v6;
  NSObject *v7;

  v6 = sub_10001C4E8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_100034AAC((uint64_t)a4, a3, v7);

}

- (id)_stringGestaltQueryForKey:(__CFString *)a3
{
  void *v4;
  int v6;

  v6 = 0;
  v4 = (void *)MGCopyAnswerWithError(a3, 0, &v6);
  if (v6)
    -[SystemConfig _handleGestaltError:forKey:](self, "_handleGestaltError:forKey:");
  return v4;
}

- (BOOL)_BOOLGestaltQueryForKey:(__CFString *)a3
{
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  BOOL v6;
  int v8;

  v8 = 0;
  v4 = (const __CFBoolean *)MGCopyAnswerWithError(a3, 0, &v8);
  if (v4)
  {
    v5 = v4;
    v6 = CFBooleanGetValue(v4) != 0;
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  if (v8)
    -[SystemConfig _handleGestaltError:forKey:](self, "_handleGestaltError:forKey:");
  return v6;
}

- (NSString)deviceName
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (qword_100069630 != -1)
    dispatch_once(&qword_100069630, &stru_100055C18);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10001B510;
  v10 = sub_10001B520;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B528;
  v5[3] = &unk_100055C40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)qword_100069628, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)deviceNameMayNeedUpdate
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device name may need update", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemConfig deviceName](self, "deviceName"));
  -[SystemConfig setDeviceNameUpToDate:](self, "setDeviceNameUpToDate:", 0);
  v6 = objc_claimAutoreleasedReturnValue(-[SystemConfig deviceName](self, "deviceName"));
  v7 = (void *)v6;
  if (!v5 && v6 || v5 && !v6 || (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    v8 = sub_10001C4E8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Post notification for device name need update", v11, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("DeviceNameChangedNotification"), 0);

  }
}

- (NSString)deviceClassString
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B764;
  block[3] = &unk_100055230;
  block[4] = self;
  if (qword_100069640 != -1)
    dispatch_once(&qword_100069640, block);
  return (NSString *)(id)qword_100069638;
}

- (NSString)deviceUDID
{
  void *v2;
  unsigned int v3;
  void *v4;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B8A0;
  block[3] = &unk_100055230;
  block[4] = self;
  if (qword_100069650 != -1)
    dispatch_once(&qword_100069650, block);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if (!objc_msgSend(v2, "isInternalBuild"))
    goto LABEL_9;
  v3 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("GainsboroughSimulationPhone"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));

  if (v3)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("GainsboroughPhoneUDID"), CFSTR("com.apple.icloud.fmflocatord.notbackedup")));
    if (v2)
      v4 = v2;
    else
      v4 = (void *)qword_100069648;
    objc_storeStrong((id *)&qword_100069648, v4);
LABEL_9:

  }
  return (NSString *)(id)qword_100069648;
}

- (NSString)idsDeviceID
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;

  v2 = (void *)qword_100069658;
  if (!qword_100069658)
  {
    v3 = IDSCopyLocalDeviceUniqueID(0, a2);
    v4 = (void *)qword_100069658;
    qword_100069658 = v3;

    v2 = (void *)qword_100069658;
    if (!qword_100069658)
    {
      v5 = sub_10001C4E8();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_100034B30(v6);

      v2 = (void *)qword_100069658;
    }
  }
  return (NSString *)v2;
}

- (NSString)productType
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B9B0;
  block[3] = &unk_100055230;
  block[4] = self;
  if (qword_100069668 != -1)
    dispatch_once(&qword_100069668, block);
  return (NSString *)(id)qword_100069660;
}

- (NSString)productName
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BA58;
  block[3] = &unk_100055230;
  block[4] = self;
  if (qword_100069678 != -1)
    dispatch_once(&qword_100069678, block);
  return (NSString *)(id)qword_100069670;
}

- (NSString)productVersion
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BB00;
  block[3] = &unk_100055230;
  block[4] = self;
  if (qword_100069688 != -1)
    dispatch_once(&qword_100069688, block);
  return (NSString *)(id)qword_100069680;
}

- (NSString)buildVersion
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BBE4;
  block[3] = &unk_100055230;
  block[4] = self;
  if (qword_100069698 != -1)
    dispatch_once(&qword_100069698, block);
  return (NSString *)(id)qword_100069690;
}

- (NSString)platform
{
  return (NSString *)CFSTR("iphoneos");
}

- (BOOL)isBuddyDone
{
  return BYSetupAssistantNeedsToRun(self, a2) ^ 1;
}

- (NSString)deviceColor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BCEC;
  block[3] = &unk_100055230;
  block[4] = self;
  if (qword_1000696A8 != -1)
    dispatch_once(&qword_1000696A8, block);
  return (NSString *)(id)qword_1000696A0;
}

- (NSString)deviceEnclosureColor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BD94;
  block[3] = &unk_100055230;
  block[4] = self;
  if (qword_1000696B8 != -1)
    dispatch_once(&qword_1000696B8, block);
  return (NSString *)(id)qword_1000696B0;
}

- (NSString)serialNumber
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BE3C;
  block[3] = &unk_100055230;
  block[4] = self;
  if (qword_1000696C8 != -1)
    dispatch_once(&qword_1000696C8, block);
  return (NSString *)(id)qword_1000696C0;
}

- (NSString)timezone
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return (NSString *)v3;
}

- (NSString)locale
{
  return (NSString *)(id)CFPreferencesCopyAppValue(CFSTR("AppleLocale"), kCFPreferencesCurrentApplication);
}

- (void)localeMayNeedUpdate
{
  id v2;

  CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("LocaleChangedNotification"), 0);

}

- (BOOL)isLocationServicesEnabled
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemConfig _currentLocationServicesState](self, "_currentLocationServicesState"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[CLLocationManager locationServicesEnabled](CLLocationManager, "locationServicesEnabled")));
    -[SystemConfig set_currentLocationServicesState:](self, "set_currentLocationServicesState:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemConfig _currentLocationServicesState](self, "_currentLocationServicesState"));
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)isRegionMonitoringAvailable
{
  uint64_t v2;

  v2 = objc_opt_class(CLCircularRegion, a2);
  return +[CLLocationManager isMonitoringAvailableForClass:](CLLocationManager, "isMonitoringAvailableForClass:", v2);
}

- (BOOL)forceTouchAvailable
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C054;
  block[3] = &unk_100055230;
  block[4] = self;
  if (qword_1000696D8 != -1)
    dispatch_once(&qword_1000696D8, block);
  return byte_1000696D0;
}

- (NSString)connectionStatusString
{
  return (NSString *)CFSTR("unknown");
}

- (NSString)wristStatusString
{
  return 0;
}

- (BOOL)canRegisterWithIDSID
{
  return MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) - 1 < 3;
}

- (NSString)cellularPlanStatusString
{
  return 0;
}

- (BOOL)telephonyAvailable
{
  return 0;
}

- (BOOL)hasCellularCapability
{
  char v2;
  char v3;
  id v4;
  NSObject *v5;

  v2 = -[SystemConfig _BOOLGestaltQueryForKey:](self, "_BOOLGestaltQueryForKey:", CFSTR("cellular-data"));
  v3 = MAGetActivationState();
  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100034B70(v2, v3, v5);

  return v2 & v3;
}

- (unint64_t)unlockState
{
  int v2;
  id v3;
  NSObject *v4;
  int v6;

  v2 = MKBDeviceUnlockedSinceBoot(self, a2);
  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100034BFC(v2, v4);

  if (v2 != 1 && (v2 & 0x80000000) == 0)
    return 1;
  v6 = MKBGetDeviceLockState(0);
  if (v6 == 4 || v6 == 1)
    return 2;
  else
    return 3;
}

- (int)processIdentifier
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- ($ECBB963D1F6757AE96FAF80058EC9690)batteryStats
{
  void *v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_registry_entry_t v7;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v9;
  const __CFBoolean *v10;
  BOOL v11;
  const __CFBoolean *v12;
  const __CFBoolean *v13;
  BOOL v14;
  int Value;
  int v16;
  BOOL v17;
  int64_t v18;
  const __CFNumber *v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  BOOL v22;
  float v23;
  float v24;
  BOOL v25;
  BOOL v26;
  float v27;
  $ECBB963D1F6757AE96FAF80058EC9690 *result;
  uint64_t valuePtr;

  *(_QWORD *)&retstr->var0 = 0;
  retstr->var2 = 0;
  *(_QWORD *)&retstr->var3 = 0;
  v4 = objc_autoreleasePoolPush();
  v5 = IOServiceMatching("IOPMPowerSource");
  if (!v5)
    goto LABEL_40;
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
  if (!MatchingService)
    goto LABEL_40;
  v7 = MatchingService;
  retstr->var0 = 1;
  CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("FullyCharged"), kCFAllocatorDefault, 0);
  v9 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, CFSTR("IsCharging"), kCFAllocatorDefault, 0);
  v10 = v9;
  if (CFProperty)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v12 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, CFSTR("ExternalConnected"), kCFAllocatorDefault, 0);
    if (v12)
    {
      v13 = v12;
      v14 = CFBooleanGetValue(v12) != 0;
      CFRelease(v13);
    }
    else
    {
      v14 = 0;
    }
    retstr->var1 = v14;
    Value = CFBooleanGetValue(CFProperty);
    v16 = CFBooleanGetValue(v10);
    if (Value)
      v17 = 1;
    else
      v17 = v16 == 0;
    v18 = v17;
    retstr->var2 = v18;
    goto LABEL_20;
  }
  retstr->var2 = 2;
  if (CFProperty)
LABEL_20:
    CFRelease(CFProperty);
  if (v10)
    CFRelease(v10);
  v19 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v7, CFSTR("CurrentCapacity"), kCFAllocatorDefault, 0);
  v20 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v7, CFSTR("MaxCapacity"), kCFAllocatorDefault, 0);
  v21 = v20;
  if (v19)
    v22 = v20 == 0;
  else
    v22 = 1;
  if (v22)
  {
    if (!v19)
      goto LABEL_37;
  }
  else
  {
    valuePtr = 0;
    CFNumberGetValue(v19, kCFNumberFloatType, (char *)&valuePtr + 4);
    CFNumberGetValue(v21, kCFNumberFloatType, &valuePtr);
    v23 = *((float *)&valuePtr + 1) / *(float *)&valuePtr;
    v24 = fabsf(*((float *)&valuePtr + 1) / *(float *)&valuePtr);
    v25 = v24 < INFINITY;
    v26 = v24 <= INFINITY;
    v27 = 0.0;
    if (v25)
      v27 = *((float *)&valuePtr + 1) / *(float *)&valuePtr;
    if (v26)
      v23 = v27;
    retstr->var3 = v23;
  }
  CFRelease(v19);
LABEL_37:
  if (v21)
    CFRelease(v21);
  IOObjectRelease(v7);
LABEL_40:
  objc_autoreleasePoolPop(v4);
  return result;
}

- (BOOL)isFMFAppRemoved
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v3 = objc_msgSend(v2, "applicationIsInstalled:", CFSTR("com.apple.findmy")) ^ 1;

  return v3;
}

+ (BOOL)isString:(id)a3 equalToCaseInsensitiveString:(id)a4
{
  return objc_msgSend(a3, "compare:options:", a4, 1) == 0;
}

- (PreferencesMgr)preferencesMgr
{
  return self->_preferencesMgr;
}

- (void)setPreferencesMgr:(id)a3
{
  objc_storeStrong((id *)&self->_preferencesMgr, a3);
}

- (NSNumber)_currentLocationServicesState
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_currentLocationServicesState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)deviceNameUpToDate
{
  return self->_deviceNameUpToDate;
}

- (void)setDeviceNameUpToDate:(BOOL)a3
{
  self->_deviceNameUpToDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentLocationServicesState, 0);
  objc_storeStrong((id *)&self->_preferencesMgr, 0);
}

@end
