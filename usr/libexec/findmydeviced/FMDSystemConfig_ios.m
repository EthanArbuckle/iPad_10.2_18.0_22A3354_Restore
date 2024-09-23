@implementation FMDSystemConfig_ios

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("FMDDevicePasscodeMayHaveChangedNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("FMDDeviceNameMayHaveChangedNotification"), 0);

  v5.receiver = self;
  v5.super_class = (Class)FMDSystemConfig_ios;
  -[FMDSystemConfig_ios dealloc](&v5, "dealloc");
}

- (FMDSystemConfig_ios)init
{
  objc_super v4;

  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("*** Trying to explicitly init FMDSystemConfig_iOS. Use '+sharedInstance'"));
  v4.receiver = self;
  v4.super_class = (Class)FMDSystemConfig_ios;

  return 0;
}

- (void)initializeSystemConfig
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDSystemConfig_ios;
  -[FMDSystemConfig initializeSystemConfig](&v6, "initializeSystemConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "currentPasscodeStateMayNeedUpdate", CFSTR("FMDDevicePasscodeMayHaveChangedNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "deviceNameMayNeedUpdate", CFSTR("FMDDeviceNameMayHaveChangedNotification"), 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10006CC8C, CFSTR("com.apple.system.timezone"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_handleGestaltError:(int)a3 forKey:(__CFString *)a4
{
  id v6;
  NSObject *v7;

  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_100229FE4((uint64_t)a4, a3, v7);

}

- (id)_stringGestaltQueryForKey:(__CFString *)a3
{
  void *v4;
  int v6;

  v6 = 0;
  v4 = (void *)MGCopyAnswerWithError(a3, 0, &v6);
  if (v6)
    -[FMDSystemConfig_ios _handleGestaltError:forKey:](self, "_handleGestaltError:forKey:");
  return v4;
}

- (id)_numberGestaltQueryForKey:(__CFString *)a3
{
  void *v4;
  int v6;

  v6 = 0;
  v4 = (void *)MGCopyAnswerWithError(a3, 0, &v6);
  if (v6)
    -[FMDSystemConfig_ios _handleGestaltError:forKey:](self, "_handleGestaltError:forKey:");
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
    -[FMDSystemConfig_ios _handleGestaltError:forKey:](self, "_handleGestaltError:forKey:");
  return v6;
}

- (id)deviceName
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (qword_100306688 != -1)
    dispatch_once(&qword_100306688, &stru_1002C3DA0);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10006CF3C;
  v10 = sub_10006CF4C;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006CF54;
  v5[3] = &unk_1002C3DC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)qword_100306680, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
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

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device name may need update", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSystemConfig_ios deviceName](self, "deviceName"));
  self->_deviceNameUpToDate = 0;
  v6 = objc_claimAutoreleasedReturnValue(-[FMDSystemConfig_ios deviceName](self, "deviceName"));
  v7 = (void *)v6;
  if (!v5 && v6 || v5 && !v6 || (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    v8 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Post notification for device name need update", v11, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("FMDDeviceNameChangedNotification"), 0);

  }
}

- (id)deviceClassString
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D1A4;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_100306698 != -1)
    dispatch_once(&qword_100306698, block);
  return (id)qword_100306690;
}

- (int64_t)deviceClass
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D248;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_1003066A8 != -1)
    dispatch_once(&qword_1003066A8, block);
  return qword_1003066A0;
}

- (id)deviceUDID
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D350;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_1003066B8 != -1)
    dispatch_once(&qword_1003066B8, block);
  return (id)qword_1003066B0;
}

- (id)productType
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D3F8;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_1003066C8 != -1)
    dispatch_once(&qword_1003066C8, block);
  return (id)qword_1003066C0;
}

- (id)productName
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D4A0;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_1003066D8 != -1)
    dispatch_once(&qword_1003066D8, block);
  return (id)qword_1003066D0;
}

- (id)productVersion
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D548;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_1003066E8 != -1)
    dispatch_once(&qword_1003066E8, block);
  return (id)qword_1003066E0;
}

- (id)buildVersion
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D610;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_1003066F8 != -1)
    dispatch_once(&qword_1003066F8, block);
  return (id)qword_1003066F0;
}

- (id)deviceModel
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D6D8;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_100306708 != -1)
    dispatch_once(&qword_100306708, block);
  return (id)qword_100306700;
}

- (id)deviceRegion
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D780;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_100306718 != -1)
    dispatch_once(&qword_100306718, block);
  return (id)qword_100306710;
}

- (id)platform
{
  return CFSTR("iphoneos");
}

- (BOOL)isBuddyDone
{
  return BYSetupAssistantNeedsToRun(self, a2) ^ 1;
}

- (BOOL)allowsActivationLock
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v9;
  const __CFString *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  if (objc_msgSend(v3, "isActivationLockAllowed")
    && (+[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings")) & 1) == 0&& -[FMDSystemConfig_ios isBuddyDone](self, "isBuddyDone"))
  {
    v4 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("BlockActivationLock"), kFMDNotBackedUpPrefDomain) ^ 1;
  }
  else
  {
    v4 = 0;
  }

  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Activation lock is allowed - [%@]", (uint8_t *)&v9, 0xCu);
  }

  return v4;
}

- (id)deviceColor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D988;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_100306728 != -1)
    dispatch_once(&qword_100306728, block);
  return (id)qword_100306720;
}

- (id)deviceEnclosureColor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DA30;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_100306738 != -1)
    dispatch_once(&qword_100306738, block);
  return (id)qword_100306730;
}

- (id)coverGlassColor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DAD8;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_100306748 != -1)
    dispatch_once(&qword_100306748, block);
  return (id)qword_100306740;
}

- (id)housingColor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DB9C;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_100306758 != -1)
    dispatch_once(&qword_100306758, block);
  return (id)qword_100306750;
}

- (id)backOfEnclosureColor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DC60;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_100306768 != -1)
    dispatch_once(&qword_100306768, block);
  return (id)qword_100306760;
}

- (BOOL)hasSecureElement
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DD20;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_100306778 != -1)
    dispatch_once(&qword_100306778, block);
  return byte_100306770;
}

- (BOOL)hasNFC
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DDBC;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_100306788 != -1)
    dispatch_once(&qword_100306788, block);
  return byte_100306780;
}

- (id)internationalMobileEquipmentIdentity
{
  return -[FMDSystemConfig_ios _stringGestaltQueryForKey:](self, "_stringGestaltQueryForKey:", CFSTR("InternationalMobileEquipmentIdentity"));
}

- (id)internationalMobileEquipmentIdentityTwo
{
  return -[FMDSystemConfig_ios _stringGestaltQueryForKey:](self, "_stringGestaltQueryForKey:", CFSTR("xRyzf9zFE/ycr/wJPweZvQ"));
}

- (id)mobileEquipmentIdentifier
{
  return -[FMDSystemConfig_ios _stringGestaltQueryForKey:](self, "_stringGestaltQueryForKey:", CFSTR("MobileEquipmentIdentifier"));
}

- (id)serialNumber
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DE80;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_100306798 != -1)
    dispatch_once(&qword_100306798, block);
  return (id)qword_100306790;
}

- (id)chipId
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DF28;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_1003067A8 != -1)
    dispatch_once(&qword_1003067A8, block);
  return (id)qword_1003067A0;
}

- (id)ecid
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DFD0;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_1003067B8 != -1)
    dispatch_once(&qword_1003067B8, block);
  return (id)qword_1003067B0;
}

- (id)wifiMacAddress
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E078;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_1003067C8 != -1)
    dispatch_once(&qword_1003067C8, block);
  return (id)qword_1003067C0;
}

- (id)btMacAddress
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E120;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_1003067D8 != -1)
    dispatch_once(&qword_1003067D8, block);
  return (id)qword_1003067D0;
}

- (id)timezone
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return v3;
}

- (id)locale
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localeIdentifier"));

  return v3;
}

- (int)currentPasscodeConstraint
{
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  if (qword_1003067F0 != -1)
    dispatch_once(&qword_1003067F0, &stru_1002C3DE8);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006E2B8;
  v5[3] = &unk_1002C3DC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)qword_1003067E8, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isLocked
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = MKBGetDeviceLockState(0, a2);
  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10022A068(v2, v4, v5, v6, v7, v8, v9, v10);

  return (_DWORD)v2 == 1 || (_DWORD)v2 == 4;
}

- (unint64_t)unlockState
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  unint64_t v14;

  v2 = MKBDeviceUnlockedSinceBoot(self, a2);
  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10022A0D0(v2, v4, v5, v6, v7, v8, v9, v10);

  if ((_DWORD)v2 != 1 && (v2 & 0x80000000) == 0)
    return 1;
  v13 = MKBGetDeviceLockState(0, v11);
  v14 = 2;
  if (v13 != 1)
    v14 = 3;
  if (v13 == 2)
    return 4;
  else
    return v14;
}

- (BOOL)isLocking
{
  return MKBGetDeviceLockState(0, a2) == 2;
}

- (BOOL)isPasscodeSet
{
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (qword_100306808 != -1)
    dispatch_once(&qword_100306808, &stru_1002C3E08);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006E550;
  v5[3] = &unk_1002C3DC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)qword_100306800, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isPasscodeChangeRestricted
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = objc_msgSend(v2, "isPasscodeModificationAllowed") ^ 1;

  return v3;
}

- (void)currentPasscodeStateMayNeedUpdate
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  id v7;

  v3 = -[FMDSystemConfig_ios currentPasscodeConstraint](self, "currentPasscodeConstraint");
  self->_passcodeConstraintUpToDate = 0;
  v4 = -[FMDSystemConfig_ios currentPasscodeConstraint](self, "currentPasscodeConstraint");
  v5 = -[FMDSystemConfig_ios isPasscodeSet](self, "isPasscodeSet");
  self->_passcodeStateUpToDate = 0;
  v6 = -[FMDSystemConfig_ios isPasscodeSet](self, "isPasscodeSet");
  if (v3 != v4 || v5 != v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("FMDPasscodeStateChangedNotification"), 0);

  }
}

- (id)currentPasscodeConstraintStr
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (qword_100306820 != -1)
    dispatch_once(&qword_100306820, &stru_1002C3E28);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10006CF3C;
  v10 = sub_10006CF4C;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006E7EC;
  v5[3] = &unk_1002C3DC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)qword_100306818, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isLocationServicesEnabled
{
  return +[CLLocationManager locationServicesEnabled](CLLocationManager, "locationServicesEnabled");
}

- (BOOL)isRegionMonitoringAvailable
{
  uint64_t v2;

  v2 = objc_opt_class(CLCircularRegion, a2);
  return +[CLLocationManager isMonitoringAvailableForClass:](CLLocationManager, "isMonitoringAvailableForClass:", v2);
}

- (BOOL)hasCellularCapability
{
  if (-[FMDSystemConfig_ios _BOOLGestaltQueryForKey:](self, "_BOOLGestaltQueryForKey:", CFSTR("CellularTelephonyCapability")))
  {
    return 1;
  }
  else
  {
    return -[FMDSystemConfig_ios _BOOLGestaltQueryForKey:](self, "_BOOLGestaltQueryForKey:", CFSTR("cellular-data"));
  }
}

- (id)deletablePlans
{
  return &off_1002D81A0;
}

- (id)escrowHash
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activationLockBypassHash"));

  return v3;
}

- (BOOL)isLowPowerModeEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  return v3;
}

- (BOOL)isLocationServicesEnabledForShareMyLocation
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FMF.framework")));
  v3 = +[CLLocationManager authorizationStatusForBundle:](CLLocationManager, "authorizationStatusForBundle:", v2);

  return v3 == 3;
}

- (BOOL)isFMIPLocationServicesEnabled
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyDevice.framework")));
  v3 = +[CLLocationManager authorizationStatusForBundle:](CLLocationManager, "authorizationStatusForBundle:", v2);

  return v3 == 3;
}

- (BOOL)canHandleLocates
{
  unsigned __int8 v3;

  v3 = -[FMDSystemConfig_ios isFMIPLocationServicesEnabled](self, "isFMIPLocationServicesEnabled");
  return v3 & -[FMDSystemConfig_ios isLocationServicesEnabled](self, "isLocationServicesEnabled");
}

- (BOOL)isRoseCapable
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006EB54;
  block[3] = &unk_1002C1328;
  block[4] = self;
  if (qword_100306830 != -1)
    dispatch_once(&qword_100306830, block);
  return qword_100306828 != 0;
}

- (int64_t)connectionStatus
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMNetworkMonitor sharedInstance](FMNetworkMonitor, "sharedInstance"));
  if (objc_msgSend(v2, "isMonitoring"))
  {
    if (objc_msgSend(v2, "isNetworkUp"))
      v3 = 2;
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)wristStatusString
{
  return 0;
}

- (unint64_t)pairingType
{
  return 1;
}

- (id)suinfoLastModifiedTimestamp
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSystemConfig_ios pscSUIURL](self, "pscSUIURL"));
  v12 = 0;
  v11 = 0;
  objc_msgSend(v2, "getResourceValue:forKey:error:", &v12, NSURLContentModificationDateKey, &v11);
  v3 = v12;
  v4 = v11;
  v5 = v4;
  if (v4)
    v6 = 1;
  else
    v6 = v3 == 0;
  if (v6)
  {
    if (v4)
    {
      v7 = sub_1000031B8();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10022A138((uint64_t)v2, (uint64_t)v5, v8);

    }
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fm_epochObject"));
  }

  return v9;
}

- (id)pscSUIURL
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;

  v2 = container_system_group_path_for_identifier(0, "systemgroup.com.apple.pisco.suinfo", 0);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = sub_1000031B8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "System group container path is %s", (uint8_t *)&v9, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v3, 1, 0));
    free(v3);
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/ProvenanceV2/psc.sui"), 0));

  return v7;
}

- (unint64_t)alCapability
{
  return 5;
}

@end
