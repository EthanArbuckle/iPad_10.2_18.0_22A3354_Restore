@implementation BKTetherController

- (BOOL)usesDisplayPortTethering
{
  if (qword_100117488 != -1)
    dispatch_once(&qword_100117488, &stru_1000EB6C8);
  return byte_100117480;
}

- (BOOL)isTethered
{
  void *v3;
  void *v4;
  unsigned int v5;
  BKTetherController *v6;
  uint64_t v7;
  id v8;
  void *v9;
  mach_port_t v10;
  uint64_t v11;
  uint32_t outputCnt;
  uint64_t input;

  if (self->_tetherState)
    return self->_tetherState == 1;
  if (!-[BKTetherController usesDisplayPortTethering](self, "usesDisplayPortTethering"))
  {
    v10 = -[BKTetherController _demoCardConnection](self, "_demoCardConnection");
    if (v10)
    {
      input = 0;
      outputCnt = 0;
      if (IOConnectCallScalarMethod(v10, 0, &input, 1u, 0, &outputCnt))
        v11 = 2;
      else
        v11 = 1;
    }
    else
    {
      v11 = 2;
    }
    v6 = self;
    goto LABEL_15;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults externalDefaults](BKSDefaults, "externalDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lockdownDefaults"));
  v5 = objc_msgSend(v4, "tetheredDisplayPortMode");

  v6 = self;
  if (!v5)
  {
    v11 = 2;
LABEL_15:
    -[BKTetherController _setTetherState:](v6, "_setTetherState:", v11);
    return self->_tetherState == 1;
  }
  if (BSGetDeviceType(-[BKTetherController _setTetherState:](self, "_setTetherState:", 1)) == 2)
    v7 = 9;
  else
    v7 = 8;
  -[BKTetherController _postDisplayPortNotificationCode:](self, "_postDisplayPortNotificationCode:", v7);
  v8 = sub_10001A7F4();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[BKTetherController noteInterfaceOrientationChangedWithInterfaceOrientation:](self, "noteInterfaceOrientationChangedWithInterfaceOrientation:", sub_100019D70((uint64_t)v9));

  return self->_tetherState == 1;
}

+ (id)sharedInstance
{
  if (qword_100117478 != -1)
    dispatch_once(&qword_100117478, &stru_1000EB6A8);
  return (id)qword_100117470;
}

- (BKTetherController)init
{
  BKTetherController *v2;
  BKTetherController *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKTetherController;
  v2 = -[BKTetherController init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    if (-[BKTetherController usesDisplayPortTethering](v2, "usesDisplayPortTethering"))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_10005D9AC, CFSTR("com.apple.mobile.demo_mode_changed"), 0, CFNotificationSuspensionBehaviorDrop);
      v3->_lastOrientationCode = -1;
    }
    if (-[BKTetherController isTethered](v3, "isTethered"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
      v6 = objc_msgSend(v5, "isDitheringEnabled");

      -[BKTetherController setDitheringEnabled:](v3, "setDitheringEnabled:", v6);
    }
  }
  return v3;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)BKTetherController;
  -[BKTetherController dealloc](&v4, "dealloc");
}

- (unsigned)_demoCardConnection
{
  unsigned int result;
  unsigned int *p_demoCardConnection;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  const __CFDictionary *v10;
  uint64_t MatchingServices;
  uint64_t v12;
  uint64_t v13;
  io_service_t v14;
  io_object_t v15;
  kern_return_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  mach_port_t mainPort[2];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;

  p_demoCardConnection = &self->_demoCardConnection;
  result = self->_demoCardConnection;
  if (!result)
  {
    *(_QWORD *)mainPort = 0;
    v4 = IOMainPort(0, &mainPort[1]);
    if ((_DWORD)v4)
    {
      v5 = BKLogCommon(v4);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[BKTetherController _demoCardConnection]";
        v7 = "%s IOMainPort failed";
LABEL_5:
        v8 = v6;
        v9 = 12;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    v10 = IOServiceMatching("AppleTetheredDevice");
    if (v10)
    {
      MatchingServices = IOServiceGetMatchingServices(mainPort[1], v10, mainPort);
      if ((_DWORD)MatchingServices)
      {
        v12 = BKLogCommon(MatchingServices);
        v6 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v22 = "-[BKTetherController _demoCardConnection]";
          v7 = "%s IOServiceGetMatchingServices failed";
          goto LABEL_5;
        }
LABEL_14:

        return 0;
      }
      v14 = IOIteratorNext(mainPort[0]);
      if (v14)
      {
        v15 = v14;
        v16 = IOServiceOpen(v14, mach_task_self_, 0, p_demoCardConnection);
        v17 = IOObjectRelease(v15);
        if (!v16)
          return *p_demoCardConnection;
        v18 = BKLogCommon(v17);
        v6 = objc_claimAutoreleasedReturnValue(v18);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136315394;
        v22 = "-[BKTetherController _demoCardConnection]";
        v23 = 2082;
        v24 = "AppleTetheredDevice";
        v7 = "%s IOServiceOpen failed for class '%{public}s'";
      }
      else
      {
        v19 = ((uint64_t (*)(void))BKLogCommon)();
        v6 = objc_claimAutoreleasedReturnValue(v19);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136315394;
        v22 = "-[BKTetherController _demoCardConnection]";
        v23 = 2082;
        v24 = "AppleTetheredDevice";
        v7 = "%s No %{public}s instance found";
      }
    }
    else
    {
      v13 = ((uint64_t (*)(void))BKLogCommon)();
      v6 = objc_claimAutoreleasedReturnValue(v13);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      *(_DWORD *)buf = 136315394;
      v22 = "-[BKTetherController _demoCardConnection]";
      v23 = 2082;
      v24 = "AppleTetheredDevice";
      v7 = "%s IOServiceMatching failed for %{public}s";
    }
    v8 = v6;
    v9 = 22;
    goto LABEL_13;
  }
  return result;
}

- (void)_postDisplayPortNotificationCode:(int)a3
{
  __CFString *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  int v9;

  v4 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("com.apple.mobile.demo.mode-%d"), *(_QWORD *)&a3);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v4, 0, 0, 1u);
  v6 = BKLogDetailed();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v9 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "DEMO MODE NOTIFICATION: %d", buf, 8u);
  }

}

- (void)_setTetherState:(int)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;

  if (self->_tetherState != a3)
  {
    if (-[BKTetherController usesDisplayPortTethering](self, "usesDisplayPortTethering"))
    {
      if (a3 == 1)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10005D960, CFSTR("com.apple.backboardd.deviceinterfaceorientation"), 0, CFNotificationSuspensionBehaviorDrop);
        CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10005D960, CFSTR("com.apple.springboard.hasBlankedScreen"), 0, CFNotificationSuspensionBehaviorDrop);
      }
      else if (self->_tetherState == 1)
      {
        v6 = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterRemoveObserver(v6, self, CFSTR("com.apple.backboardd.deviceinterfaceorientation"), 0);
        CFNotificationCenterRemoveObserver(v6, self, CFSTR("com.apple.springboard.hasBlankedScreen"), 0);
        self->_lastOrientationCode = -1;
      }
    }
    self->_tetherState = a3;
  }
}

- (void)_handleDemoModeChanged
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  unsigned int v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;

  if (-[BKTetherController usesDisplayPortTethering](self, "usesDisplayPortTethering"))
  {
    -[BKTetherController _setTetherState:](self, "_setTetherState:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("BKTetherControllerTetherStateChangedNotification"), self);

    v4 = BKLogDetailed();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = -[BKTetherController isTethered](self, "isTethered");
      v8 = CFSTR("not tethered");
      if (v7)
        v8 = CFSTR("tethered");
      v9 = 138412290;
      v10 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "DEMO MODE CHANGED: Now %@", (uint8_t *)&v9, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.backboardd.tetherStateChanged"), 0, 0, 1u);
  }
}

- (void)noteInterfaceOrientationChangedWithInterfaceOrientation:(int)a3
{
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  mach_port_t v8;
  uint64_t v9;
  unsigned int v10;
  BOOL v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  uint32_t outputCnt;
  uint64_t input[10];
  uint8_t buf[4];
  int v21;

  if (-[BKTetherController usesDisplayPortTethering](self, "usesDisplayPortTethering"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayController sharedInstance](BKDisplayController, "sharedInstance"));
    v6 = objc_msgSend(v5, "displayIsBlanked:", 0);

    if ((v6 & 1) == 0)
    {
      buf[0] = 0;
      input[0] = (uint64_t)_NSConcreteStackBlock;
      input[1] = 3221225472;
      input[2] = (uint64_t)sub_10000FBA8;
      input[3] = (uint64_t)&unk_1000EA5A0;
      memset(&input[4], 0, 24);
      input[7] = (uint64_t)buf;
      input[8] = 0;
      input[9] = 0;
      sub_10000FA60(input);
      switch(a3)
      {
        case 1:
          if (buf[0] == 3)
            v10 = 2;
          else
            v10 = 1;
          v11 = buf[0] == 1;
          v12 = 3;
          goto LABEL_34;
        case 2:
          if (buf[0] == 3)
            v10 = 3;
          else
            v10 = 4;
          v11 = buf[0] == 1;
          v12 = 2;
          goto LABEL_34;
        case 3:
          if (buf[0] == 3)
            v17 = 4;
          else
            v17 = 2;
          if (buf[0] == 1)
            v7 = 1;
          else
            v7 = v17;
          goto LABEL_37;
        case 4:
          if (buf[0] == 3)
            v10 = 1;
          else
            v10 = 3;
          v11 = buf[0] == 1;
          v12 = 4;
LABEL_34:
          if (v11)
            v7 = v12;
          else
            v7 = v10;
          goto LABEL_37;
        default:
          return;
      }
    }
    v7 = 5;
LABEL_37:
    if ((_DWORD)v7 != self->_lastOrientationCode)
    {
      if (!self->_orientationNotificationsDisabled)
        -[BKTetherController _postDisplayPortNotificationCode:](self, "_postDisplayPortNotificationCode:", v7);
      self->_lastOrientationCode = v7;
    }
    return;
  }
  v8 = -[BKTetherController _demoCardConnection](self, "_demoCardConnection");
  if (!v8)
    return;
  v9 = a3;
  input[0] = 0;
  if (a3 == 4)
  {
    v9 = 2;
  }
  else if (a3 != 3)
  {
    if (a3 != 2)
      goto LABEL_16;
    v9 = 1;
  }
  input[0] = v9;
LABEL_16:
  outputCnt = 0;
  v13 = IOConnectCallScalarMethod(v8, 1u, input, 1u, 0, &outputCnt);
  if ((_DWORD)v13)
  {
    v14 = v13;
    v15 = BKLogCommon(v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Demo card rotation failed, result = %08x\n", buf, 8u);
    }

  }
}

- (void)setDitheringEnabled:(int)a3
{
  uint64_t v3;
  const __CFDictionary *v4;
  uint64_t MatchingService;
  const __CFDictionary *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  int v19;
  CFTypeRef cf;
  uint8_t buf[4];
  int v22;

  v3 = *(_QWORD *)&a3;
  cf = 0;
  v4 = IOServiceMatching("AppleH1CLCD");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if (!(_DWORD)MatchingService)
  {
    v6 = IOServiceMatching("AppleM2CLCD");
    v7 = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    MatchingService = v7;
    if (!(_DWORD)v7)
    {
      v18 = BKLogCommon(v7);
      v11 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "Couldn't find framebuffer service";
        goto LABEL_12;
      }
LABEL_13:

      return;
    }
  }
  v8 = IOMobileFramebufferOpen(MatchingService, mach_task_self_, 0, &cf);
  v9 = IOObjectRelease(MatchingService);
  if (v8)
  {
    v10 = BKLogCommon(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Couldn't open framebuffer service";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v19 = 0;
  v13 = IOMobileFramebufferSetDebugFlags(cf, v3, 32, &v19);
  v14 = v13;
  v15 = BKLogCommon(v13);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Couldn't set debug flags", buf, 2u);
    }

  }
  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 67109120;
      v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Tether dithering: %d", buf, 8u);
    }

    if (cf)
      CFRelease(cf);
  }
}

- (BOOL)_serviceExists:(__CFString *)a3
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  const __CFString *v7;
  SCPreferencesRef v8;
  const __SCPreferences *v9;
  const __CFArray *v10;
  const __CFArray *v11;
  CFIndex Count;
  CFIndex v13;
  CFIndex v14;
  const __SCNetworkService *ValueAtIndex;
  const __SCNetworkInterface *Interface;
  CFStringRef BSDName;
  uint64_t v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v24;
  NSObject *v25;
  uint8_t buf[4];
  int v27;

  v4 = BKLogCommon(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reverse-Tethering - Looking for Service", buf, 2u);
  }

  v6 = getprogname();
  v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s-%s"), v6, "com.apple.Preferences.reverse-tethering");
  v8 = SCPreferencesCreateWithAuthorization(kCFAllocatorDefault, v7, 0, 0);
  v9 = v8;
  if (v7)
    CFRelease(v7);
  if (!v9
    || !SCPreferencesLock(v9, 1u)
    && (SCPreferencesSynchronize(v9), v8 = (SCPreferencesRef)SCPreferencesLock(v9, 1u), !(_DWORD)v8))
  {
    v20 = 0;
    v11 = 0;
    v19 = 1001;
LABEL_22:
    v21 = BKLogCommon(v8);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "R-Tether Exists - Error Code: %d", buf, 8u);
    }

    goto LABEL_25;
  }
  v10 = SCNetworkServiceCopyAll(v9);
  v11 = v10;
  if (v10)
  {
    Count = CFArrayGetCount(v10);
    if (Count < 1)
    {
LABEL_16:
      v19 = 0;
      v20 = 0;
    }
    else
    {
      v13 = Count;
      v14 = 0;
      while (1)
      {
        ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v11, v14);
        if (ValueAtIndex)
        {
          Interface = SCNetworkServiceGetInterface(ValueAtIndex);
          if (Interface)
          {
            BSDName = SCNetworkInterfaceGetBSDName(Interface);
            if (BSDName)
            {
              v18 = CFEqual(BSDName, a3);
              if ((_DWORD)v18)
                break;
            }
          }
        }
        if (v13 == ++v14)
          goto LABEL_16;
      }
      v24 = BKLogCommon(v18);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Reverse-Tethering - Service Found", buf, 2u);
      }

      v19 = 0;
      v20 = 1;
    }
  }
  else
  {
    v20 = 0;
    v19 = 1001;
  }
  v8 = (SCPreferencesRef)SCPreferencesUnlock(v9);
  if (!(_DWORD)v8)
  {
    v8 = (SCPreferencesRef)SCError();
    v19 = (int)v8;
  }
  if (v19)
    goto LABEL_22;
LABEL_25:
  if (v11)
    CFRelease(v11);
  if (v9)
    CFRelease(v9);
  return v20;
}

- (BOOL)_reverseTetheringActive
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  const __CFDictionary *v7;
  uint64_t MatchingServices;
  int v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  io_object_t v16;
  io_object_t v17;
  CFTypeRef v18;
  const void *v19;
  unsigned int v20;
  io_iterator_t existing;
  uint8_t buf[4];
  int v24;

  v3 = BKLogCommon(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reverse-Tethering - Getting State", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = objc_msgSend(v5, "fileExistsAtPath:", CFSTR("/Library/Preferences/SystemConfiguration/rtether.plist"));

  if (!v6)
    goto LABEL_12;
  existing = 0;
  v7 = IOServiceMatching("IOEthernetInterface");
  if (!v7)
  {
    v15 = BKLogCommon(0);
    v11 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Can't create a service matching dictionary\n";
      v13 = v11;
      v14 = 2;
      goto LABEL_10;
    }
LABEL_11:

LABEL_12:
    LOBYTE(v16) = 0;
    return v16;
  }
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v7, &existing);
  if ((_DWORD)MatchingServices)
  {
    v9 = MatchingServices;
    v10 = BKLogCommon(MatchingServices);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v24 = v9;
      v12 = "IOServiceGetMatchingServices failed: 0x%x\n";
      v13 = v11;
      v14 = 8;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  while (1)
  {
    v16 = IOIteratorNext(existing);
    if (!v16)
      break;
    v17 = v16;
    *(_DWORD *)buf = 0;
    if (!IORegistryEntryGetParentEntry(v16, "IOService", (io_registry_entry_t *)buf))
    {
      if (IOObjectConformsTo(*(io_object_t *)buf, "AppleUSBEthernetDevice")
        && (v18 = IORegistryEntrySearchCFProperty(v17, "IOService", CFSTR("BSD Name"), kCFAllocatorDefault, 0)) != 0)
      {
        v19 = v18;
        v20 = -[BKTetherController _serviceExists:](self, "_serviceExists:", v18);
        CFRelease(v19);
        IOObjectRelease(v17);
        v17 = *(_DWORD *)buf;
        if (v20)
        {
          IOObjectRelease(*(io_object_t *)buf);
          LOBYTE(v16) = 1;
          return v16;
        }
      }
      else
      {
        IOObjectRelease(v17);
        v17 = *(_DWORD *)buf;
      }
    }
    IOObjectRelease(v17);
  }
  return v16;
}

- (void)updatePreferencesIfNeeded
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
  if (-[BKTetherController isTethered](self, "isTethered")
    && (objc_msgSend(v6, "ignoreTetheringPreferences") & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.backboardd.tetherPrefsNeedUpdate"), 0, 0, 1u);
    objc_msgSend(v6, "setDitheringEnabled:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults externalDefaults](BKSDefaults, "externalDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentConnectionDefaults"));

    objc_msgSend(v5, "setForceDemoMaxHBI:", 300);
    if (-[BKTetherController _reverseTetheringActive](self, "_reverseTetheringActive"))
      objc_msgSend(v5, "setWifiInterfaceName:", CFSTR("en1"));

  }
}

- (BOOL)isOrientationNotificationDisabled
{
  return self->_orientationNotificationsDisabled;
}

- (void)setOrientationNotificationDisabled:(BOOL)a3
{
  self->_orientationNotificationsDisabled = a3;
}

@end
