@implementation UIDevice

+ (BOOL)_isWatchCompanion
{
  if (qword_1ECD7E330 != -1)
    dispatch_once(&qword_1ECD7E330, &__block_literal_global_31_3);
  return byte_1ECD7E30B;
}

+ (BOOL)_isWatch
{
  if (qword_1ECD7E328 != -1)
    dispatch_once(&qword_1ECD7E328, &__block_literal_global_286);
  return byte_1ECD7E30A;
}

+ (UIDevice)currentDevice
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__UIDevice_currentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7E348 != -1)
    dispatch_once(&qword_1ECD7E348, block);
  return (UIDevice *)(id)qword_1ECD7E350;
}

- (UIUserInterfaceIdiom)userInterfaceIdiom
{
  if (initializeActiveUserInterfaceIdiom_once != -1)
    dispatch_once(&initializeActiveUserInterfaceIdiom_once, &__block_literal_global_404);
  return sActiveUserInterfaceIdiom;
}

+ (BOOL)_hasHomeButton
{
  if (qword_1ECD7E408 != -1)
    dispatch_once(&qword_1ECD7E408, &__block_literal_global_293);
  return byte_1ECD7E30F;
}

- (BOOL)_supportsForceTouch
{
  if (qword_1ECD7E3F0 != -1)
    dispatch_once(&qword_1ECD7E3F0, &__block_literal_global_263_0);
  return byte_1ECD7E30C;
}

- (void)beginGeneratingDeviceOrientationNotifications
{
  int64_t numDeviceOrientationObservers;

  numDeviceOrientationObservers = self->_numDeviceOrientationObservers;
  self->_numDeviceOrientationObservers = numDeviceOrientationObservers + 1;
  if (!numDeviceOrientationObservers)
  {
    -[UIDevice _enableDeviceOrientationEvents:](self, "_enableDeviceOrientationEvents:", 1);
    +[UIDevice currentDeviceOrientationAllowingAmbiguous:](UIDevice, "currentDeviceOrientationAllowingAmbiguous:", 0);
  }
}

void __44__UIDevice_UIDeviceInternal___hasHomeButton__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;

  +[_UIDeviceInitialDeviceConfigurationLoader sharedLoader](_UIDeviceInitialDeviceConfigurationLoader, "sharedLoader");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initialDeviceContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (!v0 || (v2 = objc_msgSend(v0, "deviceInfoIntegerValueForKey:", *MEMORY[0x1E0DC5CD0]), v2 == -1))
    v2 = (int)MGGetSInt32Answer();
  byte_1ECD7E30F = v2 != 2;
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ForceHasNoHomeButton, (uint64_t)CFSTR("ForceHasNoHomeButton")) & 1) == 0&& byte_1ECD7658C)
  {
    byte_1ECD7E30F = 0;
  }

}

- (void)_setProximityState:(BOOL)a3
{
  __int16 deviceFlags;
  __int16 v5;
  id v6;

  deviceFlags = (__int16)self->_deviceFlags;
  if (((((deviceFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 256;
    else
      v5 = 0;
    *(_WORD *)&self->_deviceFlags = deviceFlags & 0xFEFF | v5;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("UIDeviceProximityStateDidChangeNotification"), self, 0);

  }
}

- (UIDeviceOrientation)orientation
{
  if (self->_numDeviceOrientationObservers < 1)
    return 0;
  else
    return ((unint64_t)*(_WORD *)&self->_deviceFlags >> 3) & 7;
}

- (void)endGeneratingDeviceOrientationNotifications
{
  int64_t numDeviceOrientationObservers;
  BOOL v3;
  BOOL v4;
  int64_t v5;

  numDeviceOrientationObservers = self->_numDeviceOrientationObservers;
  v3 = numDeviceOrientationObservers == 1;
  v4 = numDeviceOrientationObservers < 1;
  v5 = numDeviceOrientationObservers - 1;
  if (!v4)
  {
    self->_numDeviceOrientationObservers = v5;
    if (v3)
    {
      -[UIDevice _enableDeviceOrientationEvents:](self, "_enableDeviceOrientationEvents:", 0);
      *(_WORD *)&self->_deviceFlags &= 0xFFC7u;
    }
  }
}

- (void)_enableDeviceOrientationEvents:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    objc_msgSend((id)UIApp, "_mainScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__UIDevice_Private___enableDeviceOrientationEvents___block_invoke;
    v5[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v6 = a3;
    objc_msgSend(v4, "updateUIClientSettingsWithBlock:", v5);

  }
}

- (UIDeviceBatteryState)batteryState
{
  return (unint64_t)(*(_WORD *)&self->_deviceFlags >> 6);
}

- (void)_registerForSystemSounds:(id)a3
{
  id v4;
  void *v5;
  const __CFArray *v6;
  void *v7;
  int v8;
  void *value;
  CFRange v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (const __CFArray *)qword_1ECD7E358;
    value = v4;
    if (qword_1ECD7E358)
      goto LABEL_4;
    qword_1ECD7E358 = (uint64_t)CFArrayCreateMutable(0, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__updateSystemSoundActiveStatus_, CFSTR("UIApplicationSuspendedNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__updateSystemSoundActiveStatus_, CFSTR("UIApplicationSuspendedEventsOnlyNotification"), 0);

    v5 = value;
    v6 = (const __CFArray *)qword_1ECD7E358;
    if (qword_1ECD7E358)
    {
LABEL_4:
      v10.length = CFArrayGetCount(v6);
      v10.location = 0;
      v8 = CFArrayContainsValue(v6, v10, value);
      v5 = value;
      if (!v8)
      {
        CFArrayAppendValue((CFMutableArrayRef)qword_1ECD7E358, value);
        UpdateSystemSoundActiveStatus();
        v5 = value;
      }
    }
  }

}

- (void)_updateSystemSoundActiveStatus:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (pthread_main_np())
  {
    UpdateSystemSoundActiveStatus();
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__UIDevice__updateSystemSoundActiveStatus___block_invoke;
    v5[3] = &unk_1E16B1B50;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

- (NSString)name
{
  void *v3;

  if (!UISelfTaskHasEntitlement(CFSTR("com.apple.developer.device-information.user-assigned-device-name"))
    || (-[UIDevice _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("UserAssignedDeviceName")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[UIDevice model](self, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)buildVersion
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[UIDevice _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("BuildVersion"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

- (NSString)systemName
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  if (!dyld_program_sdk_at_least()
    || (-[UIDevice _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("j9Th5smJpdztHwc+i39zIg")),
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        (v4 = v3) == 0))
  {
    -[UIDevice _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("ProductName"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3)
      v3 = CFSTR("Unknown");
  }
  v5 = v3;

  return (NSString *)v5;
}

- (NSString)model
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[UIDevice _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("DeviceName"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("iPod")))
  {

    v2 = CFSTR("iPod touch");
  }
  if (v2)
    v3 = v2;
  else
    v3 = CFSTR("Unknown");
  v4 = v3;

  return v4;
}

- (NSString)systemVersion
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[UIDevice _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("ProductVersion"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

- (id)_deviceInfoForKey:(__CFString *)a3
{
  return (id)MGCopyAnswer();
}

- (BOOL)_remoteHasMicrophoneCapability
{
  -[UIDevice _loadRemoteDeviceInfoIfNeeded](self, "_loadRemoteDeviceInfoIfNeeded");
  return self->_remoteHasMicrophone;
}

- (void)_loadRemoteDeviceInfoIfNeeded
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__UIDevice_UIDevicePrivate___loadRemoteDeviceInfoIfNeeded__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (_loadRemoteDeviceInfoIfNeeded_onceToken != -1)
    dispatch_once(&_loadRemoteDeviceInfoIfNeeded_onceToken, block);
}

- (BOOL)isBatteryMonitoringEnabled
{
  return *(_WORD *)&self->_deviceFlags & 1;
}

uint64_t __52__UIDevice_Private___enableDeviceOrientationEvents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeviceOrientationEventsEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)isGeneratingDeviceOrientationNotifications
{
  return self->_numDeviceOrientationObservers > 0;
}

- (int64_t)_graphicsQuality
{
  return 100;
}

uint64_t __48__UIDevice_UIDevicePrivate___supportsForceTouch__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECD7E30C = result;
  return result;
}

- (NSUUID)identifierForVendor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceIdentifierForVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (float)batteryLevel
{
  if ((*(_WORD *)&self->_deviceFlags & 0xC0) != 0)
    return self->_batteryLevel;
  else
    return -1.0;
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  int v4;
  _BOOL8 v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_numDeviceOrientationObservers >= 1)
  {
    v4 = a3;
    if ((((unint64_t)*(_WORD *)&self->_deviceFlags >> 3) & 7) != a3)
    {
      v6 = a4;
      if (qword_1ECD7E430 != -1)
        dispatch_once(&qword_1ECD7E430, &__block_literal_global_361);
      v7 = qword_1ECD7E428;
      if (os_log_type_enabled((os_log_t)qword_1ECD7E428, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67240192;
        v13 = v4;
        _os_log_debug_impl(&dword_185066000, v7, OS_LOG_TYPE_DEBUG, "Setting device orientation to %{public}d and sending notification.", buf, 8u);
      }
      *(_WORD *)&self->_deviceFlags = *(_WORD *)&self->_deviceFlags & 0xFFC7 | (8 * (v4 & 7));
      v8 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v9, CFSTR("UIDeviceOrientationRotateAnimatedUserInfoKey"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("UIDeviceOrientationDidChangeNotification"), self, v10);

    }
  }
}

+ (int64_t)currentDeviceOrientationAllowingAmbiguous:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  int *v10;
  const char *v11;
  _BOOL4 v12;
  int v13;
  uint64_t state64;

  v3 = a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom") != 6;

  objc_msgSend((id)UIApp, "_mainScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || !objc_msgSend(v7, "isUISubclass")
    || (v8 = objc_msgSend(v7, "deviceOrientation")) == 0 && !v3)
  {
    if (v3)
    {
      v9 = &_MergedGlobals_1092;
      v10 = &dword_1ECD7E314;
      if (!_MergedGlobals_1092)
      {
        v10 = &dword_1ECD7E314;
        v11 = "com.apple.backboardd.orientation";
        goto LABEL_10;
      }
    }
    else
    {
      v9 = &byte_1ECD7E309;
      v10 = &dword_1ECD7E318;
      if (!byte_1ECD7E309)
      {
        v10 = &dword_1ECD7E318;
        v11 = "com.apple.backboardd.unambiguousOrientation";
LABEL_10:
        v12 = notify_register_check(v11, v10) == 0;
        *v9 = v12;
        if (!v12)
        {
          v8 = v5;
          goto LABEL_12;
        }
      }
    }
    v13 = *v10;
    state64 = 0;
    notify_get_state(v13, &state64);
    v8 = state64;
  }
LABEL_12:

  return v8;
}

- (BOOL)_supportsPencil
{
  void *v2;
  char v3;

  v2 = (void *)MGCopyAnswer();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

void __25__UIDevice_currentDevice__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECD7E350;
  qword_1ECD7E350 = (uint64_t)v1;

}

- (UIDevice)init
{
  UIDevice *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIDevice;
  v2 = -[UIDevice init](&v6, sel_init);
  if (v2)
  {
    *(_WORD *)&v2->_deviceFlags = *(_WORD *)&v2->_deviceFlags & 0xF7FF | ((GSEventIsHardwareKeyboardAttached() & 1) << 11);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D27C98]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HardwareKeyboardAvailabilityChanged, v4, 0, (CFNotificationSuspensionBehavior)0);

  }
  return v2;
}

void __20__UIDevice__isWatch__block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  void *v3;
  id v4;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "intValue");
  if (v0)
    CFRelease(v0);
  if (v1 == 6)
  {
    byte_1ECD7E30A = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "infoDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("WKWatchKitApp"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    byte_1ECD7E30A = objc_msgSend(v3, "BOOLValue");

  }
}

- (int64_t)_feedbackSupportLevel
{
  if (qword_1ECD7B898 != -1)
    dispatch_once(&qword_1ECD7B898, &__block_literal_global_209);
  return qword_1ECD7B8A0;
}

- (BOOL)_isHardwareKeyboardAvailable
{
  return (*(_WORD *)&self->_deviceFlags >> 11) & 1;
}

void __29__UIDevice__isWatchCompanion__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char isKindOfClass;
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("NSExtension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = v6;
  if (v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v2 = v6;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("NSExtensionPointIdentifier"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.watchkit"));

      v2 = v6;
      if (v5)
        byte_1ECD7E30B = 1;
    }
  }

}

- (BOOL)isMultitaskingSupported
{
  return MGGetBoolAnswer();
}

- (void)_unregisterForSystemSounds:(id)a3
{
  id v3;
  const __CFArray *v4;
  CFIndex FirstIndexOfValue;
  void *value;
  CFRange v7;

  v3 = a3;
  if (v3)
  {
    v4 = (const __CFArray *)qword_1ECD7E358;
    if (qword_1ECD7E358)
    {
      value = v3;
      v7.length = CFArrayGetCount((CFArrayRef)qword_1ECD7E358);
      v7.location = 0;
      FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v7, value);
      v3 = value;
      if (FirstIndexOfValue != -1)
      {
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_1ECD7E358, FirstIndexOfValue);
        UpdateSystemSoundActiveStatus();
        v3 = value;
      }
    }
  }

}

- (void)setBatteryMonitoringEnabled:(BOOL)batteryMonitoringEnabled
{
  _BOOL4 v3;
  __int16 deviceFlags;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v9;
  _BOOL4 v10;
  IONotificationPort *v11;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v13;
  __CFRunLoop *Current;
  IONotificationPort *v15;
  const __CFDictionary *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  CFRunLoopSourceRef v21;
  __CFRunLoopSource *v22;
  __CFRunLoop *v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  NSObject *v27;
  uint8_t v28[16];
  uint8_t buf[4];

  v3 = batteryMonitoringEnabled;
  deviceFlags = (__int16)self->_deviceFlags;
  if (((((deviceFlags & 1) == 0) ^ batteryMonitoringEnabled) & 1) != 0)
  {
    _batteryLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        v7 = "Battery monitoring already enabled, doing nothing";
LABEL_17:
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_INFO, v7, buf, 2u);
      }
    }
    else if (v6)
    {
      *(_WORD *)buf = 0;
      v7 = "Battery monitoring already disabled, doing nothing";
      goto LABEL_17;
    }
LABEL_18:

    return;
  }
  *(_WORD *)&self->_deviceFlags = deviceFlags & 0xFFFE | batteryMonitoringEnabled;
  _batteryLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_INFO, "Battery monitoring enabled", buf, 2u);
    }

    if (objc_msgSend((id)UIApp, "_isSpringBoard"))
    {
      *(_DWORD *)buf = 0;
      v11 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
      qword_1ECD7E448 = (uint64_t)v11;
      if (v11)
      {
        RunLoopSource = IONotificationPortGetRunLoopSource(v11);
        if (RunLoopSource)
        {
          v13 = RunLoopSource;
          Current = CFRunLoopGetCurrent();
          CFRunLoopAddSource(Current, v13, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
          v15 = (IONotificationPort *)qword_1ECD7E448;
          v16 = IOServiceMatching("IOPMPowerSource");
          LODWORD(v15) = IOServiceAddMatchingNotification(v15, "IOServiceFirstMatch", v16, (IOServiceMatchingCallback)_MatchedBatteries, &qword_1ECD7E448, (io_iterator_t *)buf);
          _batteryLog();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if ((_DWORD)v15)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v28 = 0;
              _os_log_error_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Failed to register for battery status changes: couldn't add matching notification", v28, 2u);
            }

          }
          else
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v28 = 0;
              _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_INFO, "Registered for battery status changes: added matching notification", v28, 2u);
            }

            _MatchedBatteries((IONotificationPort **)&qword_1ECD7E448, *(io_iterator_t *)buf);
          }
          IOObjectRelease(*(io_object_t *)buf);
          return;
        }
        IONotificationPortDestroy((IONotificationPortRef)qword_1ECD7E448);
        qword_1ECD7E448 = 0;
        _batteryLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          goto LABEL_18;
        *(_WORD *)v28 = 0;
        v25 = "Failed to register for battery status changes: couldn't get run loop source";
      }
      else
      {
        _batteryLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          goto LABEL_18;
        *(_WORD *)v28 = 0;
        v25 = "Failed to register for battery status changes: couldn't create notification port";
      }
      v26 = v28;
    }
    else
    {
      if (dword_1ECD7E324)
        return;
      if (!notify_register_dispatch("com.apple.system.powersources.timeremaining", &dword_1ECD7E324, MEMORY[0x1E0C80D38], &__block_literal_global_392))
      {
        _3rdParty_batteryInformationChanged();
        return;
      }
      _batteryLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_WORD *)buf = 0;
      v25 = "Could not register for battery change notification";
      v26 = buf;
    }
    _os_log_error_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, v25, v26, 2u);
    goto LABEL_18;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_INFO, "Battery monitoring disabled", buf, 2u);
  }

  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    _batteryLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_INFO, "Unregistering for battery status changes", buf, 2u);
    }

    if (dword_1ECD7E320)
    {
      _batteryLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_185066000, v20, OS_LOG_TYPE_DEBUG, "Unregistering for battery status changes: releasing matching notification", buf, 2u);
      }

      IOObjectRelease(dword_1ECD7E320);
      dword_1ECD7E320 = 0;
    }
    if (qword_1ECD7E448)
    {
      v21 = IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_1ECD7E448);
      if (v21)
      {
        v22 = v21;
        v23 = CFRunLoopGetCurrent();
        CFRunLoopRemoveSource(v23, v22, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
        _batteryLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_185066000, v24, OS_LOG_TYPE_DEBUG, "Unregistering for battery status changes: removed run loop source", buf, 2u);
        }
      }
      else
      {
        _batteryLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Unregistering for battery status changes: no run loop source", buf, 2u);
        }
      }

      _batteryLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_185066000, v27, OS_LOG_TYPE_DEBUG, "Unregistering for battery status changes: destroying notification port", buf, 2u);
      }

      IONotificationPortDestroy((IONotificationPortRef)qword_1ECD7E448);
      qword_1ECD7E448 = 0;
    }
  }
  else if (dword_1ECD7E324)
  {
    notify_cancel(dword_1ECD7E324);
    dword_1ECD7E324 = 0;
  }
  *(_WORD *)&self->_deviceFlags &= 0xFF3Fu;
}

- (void)_setBatteryState:(int64_t)a3
{
  __int16 deviceFlags;
  id v5;

  deviceFlags = (__int16)self->_deviceFlags;
  if (deviceFlags >> 6 != a3)
  {
    *(_WORD *)&self->_deviceFlags = deviceFlags & 0xFF3F | ((a3 & 3) << 6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("UIDeviceBatteryStateDidChangeNotification"), self, 0);

  }
}

- (void)_setBatteryLevel:(float)a3
{
  float v3;
  id v5;

  v3 = fminf(fmaxf(roundf(a3 * 100.0) / 100.0, 0.0), 1.0);
  if (v3 != self->_batteryLevel)
  {
    self->_batteryLevel = v3;
    if ((*(_WORD *)&self->_deviceFlags & 0xC0) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("UIDeviceBatteryLevelDidChangeNotification"), self, 0);

    }
  }
}

- (BOOL)_supportsDeepColor
{
  if (qword_1ECD7E3F8 != -1)
    dispatch_once(&qword_1ECD7E3F8, &__block_literal_global_266);
  return byte_1ECD7E30D;
}

uint64_t __59__UIDevice__UIFeedbackEngineSupport___feedbackSupportLevel__block_invoke()
{
  void *v0;
  id v1;
  uint64_t result;
  uint64_t v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)qword_1ECD7B8D8;
  v8 = qword_1ECD7B8D8;
  if (!qword_1ECD7B8D8)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getCHHapticEngineClass_block_invoke_1;
    v4[3] = &unk_1E16B14C0;
    v4[4] = &v5;
    __getCHHapticEngineClass_block_invoke_1((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  if (!objc_msgSend(v1, "supports1stPartyHaptics")
    || (result = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_DisableLevel2Feedback, (uint64_t)CFSTR("DisableLevel2Feedback")), v3 = 2, (result & 1) == 0)&& byte_1ECD761A4)
  {
    result = MGGetBoolAnswer();
    v3 = result;
  }
  qword_1ECD7B8A0 = v3;
  return result;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  unsigned int v14;
  objc_super v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (pthread_main_np() == 1)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("orientation")))
    {
      v8 = setValue_forKey____s_category;
      if (!setValue_forKey____s_category)
      {
        v8 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&setValue_forKey____s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Setting UIDevice.orientation is not supported. Please use UIWindowScene.requestGeometryUpdate(_:)", buf, 2u);
      }
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        v10 = objc_opt_class();
        v11 = v6;
        if (v10)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
        }
        else
        {
          v12 = 0;
        }
        v13 = v12;

        v14 = objc_msgSend(v13, "unsignedIntValue");
        -[UIDevice _performShimmedRequestIfPossibleForDeviceOrientation:](self, "_performShimmedRequestIfPossibleForDeviceOrientation:", v14);
      }
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)UIDevice;
      -[UIDevice setValue:forKey:](&v15, sel_setValue_forKey_, v6, v7);
    }
  }

}

void __58__UIDevice_UIDevicePrivate___loadRemoteDeviceInfoIfNeeded__block_invoke(uint64_t a1)
{
  uint32_t v2;
  uint32_t v3;
  unint64_t v4;
  NSObject *v5;
  const char *v6;
  uint32_t v7;
  uint32_t v8;
  unint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  unint64_t v14;
  NSObject *v15;
  uint64_t v16;
  unint64_t v17;
  NSObject *v18;
  uint64_t v19;
  const __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  NSObject *v23;
  unint64_t v24;
  NSObject *v25;
  const __CFString *v26;
  unint64_t v27;
  NSObject *v28;
  const __CFString *v29;
  unint64_t v30;
  NSObject *v31;
  const __CFString *v32;
  uint64_t v33;
  unint64_t v34;
  NSObject *v35;
  uint64_t v36;
  const __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  NSObject *v40;
  unint64_t v41;
  const __CFString *v42;
  _QWORD v43[5];
  uint64_t state64;
  _QWORD handler[5];
  uint8_t buf[4];
  const __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __58__UIDevice_UIDevicePrivate___loadRemoteDeviceInfoIfNeeded__block_invoke_2;
    handler[3] = &unk_1E16BDB68;
    handler[4] = *(_QWORD *)(a1 + 32);
    v2 = notify_register_dispatch("com.apple.TVPeripheralAgent.RemoteFlagsDidChange", &_loadRemoteDeviceInfoIfNeeded_remoteTypeToken, MEMORY[0x1E0C80D38], handler);
    if (v2)
    {
      v3 = v2;
      v4 = qword_1ECD7E3B8;
      if (!qword_1ECD7E3B8)
      {
        v4 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&qword_1ECD7E3B8);
      }
      if ((*(_BYTE *)v4 & 1) != 0)
      {
        v5 = *(NSObject **)(v4 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v47) = v3;
          v6 = "Error creating notification handler for remote type. status=%d";
LABEL_14:
          v10 = v5;
          v11 = OS_LOG_TYPE_ERROR;
          v12 = 8;
LABEL_73:
          _os_log_impl(&dword_185066000, v10, v11, v6, buf, v12);
          return;
        }
      }
      return;
    }
    state64 = 0;
    if (notify_get_state(_loadRemoteDeviceInfoIfNeeded_remoteTypeToken, &state64))
      return;
    v13 = state64;
    v14 = qword_1ECD7E390;
    if (!qword_1ECD7E390)
    {
      v14 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&qword_1ECD7E390);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v47) = v13;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "Initial remote flags value: %i", buf, 8u);
    }
    v16 = v13 & 1;
    if ((v13 & 2) != 0)
      v16 = 2;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = v16;
    v17 = qword_1ECD7E398;
    if (!qword_1ECD7E398)
    {
      v17 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v17, (unint64_t *)&qword_1ECD7E398);
    }
    v18 = *(NSObject **)(v17 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v20 = CFSTR("Unknown");
      if (v19 == 1)
        v20 = CFSTR("Default");
      if (v19 == 2)
        v21 = CFSTR("Rotary");
      else
        v21 = (__CFString *)v20;
      v22 = v21;
      *(_DWORD *)buf = 138543362;
      v47 = v22;
      v23 = v18;
      _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_DEFAULT, "Remote touch surface type has been initialized to: %{public}@", buf, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = (v13 & 8) != 0;
    v24 = qword_1ECD7E3A0;
    if (!qword_1ECD7E3A0)
    {
      v24 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v24, (unint64_t *)&qword_1ECD7E3A0);
    }
    v25 = *(NSObject **)(v24 + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
        v26 = CFSTR("YES");
      else
        v26 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v47 = v26;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_DEFAULT, "Remote microphone capability has been initialized to: %@", buf, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = (v13 & 4) != 0;
    v27 = qword_1ECD7E3A8;
    if (!qword_1ECD7E3A8)
    {
      v27 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v27, (unint64_t *)&qword_1ECD7E3A8);
    }
    v28 = *(NSObject **)(v27 + 8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33))
        v29 = CFSTR("YES");
      else
        v29 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v47 = v29;
      _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_DEFAULT, "Remote mute capability has been initialized to: %@", buf, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = (v13 & 0x10) != 0;
    v30 = qword_1ECD7E3B0;
    if (!qword_1ECD7E3B0)
    {
      v30 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v30, (unint64_t *)&qword_1ECD7E3B0);
    }
    v31 = *(NSObject **)(v30 + 8);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      return;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 34))
      v32 = CFSTR("YES");
    else
      v32 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v47 = v32;
    v6 = "Remote PushToTalk capability has been initialized to: %@";
LABEL_72:
    v10 = v31;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 12;
    goto LABEL_73;
  }
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __58__UIDevice_UIDevicePrivate___loadRemoteDeviceInfoIfNeeded__block_invoke_257;
  v43[3] = &unk_1E16BDB68;
  v43[4] = *(_QWORD *)(a1 + 32);
  v7 = notify_register_dispatch("com.apple.TVPeripheralAgent.RemoteTypeDidChange", &_loadRemoteDeviceInfoIfNeeded_remoteTypeToken, MEMORY[0x1E0C80D38], v43);
  if (!v7)
  {
    state64 = 0;
    if (notify_get_state(_loadRemoteDeviceInfoIfNeeded_remoteTypeToken, &state64))
      return;
    if (state64 - 1 > 4)
      v33 = 0;
    else
      v33 = qword_18667E050[state64 - 1];
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = v33;
    v34 = qword_1ECD7E3D8;
    if (!qword_1ECD7E3D8)
    {
      v34 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v34, (unint64_t *)&qword_1ECD7E3D8);
    }
    v35 = *(NSObject **)(v34 + 8);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v37 = CFSTR("Unknown");
      if (v36 == 1)
        v37 = CFSTR("Default");
      if (v36 == 2)
        v38 = CFSTR("Rotary");
      else
        v38 = (__CFString *)v37;
      v39 = v38;
      *(_DWORD *)buf = 138543362;
      v47 = v39;
      v40 = v35;
      _os_log_impl(&dword_185066000, v40, OS_LOG_TYPE_DEFAULT, "Remote touch surface type has been initialized to: %{public}@", buf, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = state64 - 1 < 5;
    v41 = qword_1ECD7E3E0;
    if (!qword_1ECD7E3E0)
    {
      v41 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v41, (unint64_t *)&qword_1ECD7E3E0);
    }
    v31 = *(NSObject **)(v41 + 8);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      return;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
      v42 = CFSTR("YES");
    else
      v42 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v47 = v42;
    v6 = "Remote microphone capability has been initialized to: %@";
    goto LABEL_72;
  }
  v8 = v7;
  v9 = qword_1ECD7E3E8;
  if (!qword_1ECD7E3E8)
  {
    v9 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&qword_1ECD7E3E8);
  }
  if ((*(_BYTE *)v9 & 1) != 0)
  {
    v5 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v47) = v8;
      v6 = "Error creating notification handler for remote type. status=%d";
      goto LABEL_14;
    }
  }
}

uint64_t __47__UIDevice_UIDevicePrivate___supportsDeepColor__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECD7E30D = result;
  return result;
}

- (id)_tapticEngine
{
  _UITapticEngine *v3;

  objc_getAssociatedObject(self, &_UIDeviceTapticEngineAssocitatedObjectKey);
  v3 = (_UITapticEngine *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[UIDevice _supportsForceTouch](self, "_supportsForceTouch"))
    {
      v3 = objc_alloc_init(_UITapticEngine);
      objc_setAssociatedObject(self, &_UIDeviceTapticEngineAssocitatedObjectKey, v3, (void *)1);
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (uint64_t)_peripheralFeedbackSupportLevel
{
  if (result)
  {
    if (qword_1ECD7B8A8 != -1)
      dispatch_once(&qword_1ECD7B8A8, &__block_literal_global_216_0);
    return _MergedGlobals_21_2;
  }
  return result;
}

uint64_t __79__UIDevice__UIFeedbackEnginePeripheralSupport___peripheralFeedbackSupportLevel__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _MergedGlobals_21_2 = result;
  return result;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D27C98]);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);

  v5.receiver = self;
  v5.super_class = (Class)UIDevice;
  -[UIDevice dealloc](&v5, sel_dealloc);
}

- (void)setOrientation:(int64_t)a3
{
  unint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = setOrientation____s_category;
  if (!setOrientation____s_category)
  {
    v5 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&setOrientation____s_category);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Setting UIDevice.orientation is not supported. Please use UIWindowScene.requestGeometryUpdate(_:)", v7, 2u);
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    a3 &= 0xFu;
    -[UIDevice _performShimmedRequestIfPossibleForDeviceOrientation:](self, "_performShimmedRequestIfPossibleForDeviceOrientation:", a3);
  }
  -[UIDevice setOrientation:animated:](self, "setOrientation:animated:", a3, 1);
}

- (BOOL)isProximityMonitoringEnabled
{
  return (*(_WORD *)&self->_deviceFlags >> 1) & 1;
}

- (void)setProximityMonitoringEnabled:(BOOL)proximityMonitoringEnabled
{
  _BOOL8 v3;
  __int16 deviceFlags;
  __int16 v6;

  v3 = proximityMonitoringEnabled;
  if (MGGetBoolAnswer())
  {
    deviceFlags = (__int16)self->_deviceFlags;
    if (((deviceFlags & 2) == 0) == v3)
    {
      if (v3)
        v6 = 2;
      else
        v6 = 0;
      *(_WORD *)&self->_deviceFlags = deviceFlags & 0xFFFD | v6;
      objc_msgSend((id)UIApp, "setProximityEventsEnabled:", v3);
      objc_msgSend((id)UIApp, "setExpectsFaceContact:inLandscape:", v3, (*(_WORD *)&self->_deviceFlags >> 2) & 1);
    }
  }
}

- (void)_setExpectsFaceContactInLandscape:(BOOL)a3
{
  _BOOL8 v3;
  __int16 deviceFlags;
  __int16 v6;

  v3 = a3;
  if (MGGetBoolAnswer())
  {
    deviceFlags = (__int16)self->_deviceFlags;
    if (((deviceFlags & 4) == 0) == v3)
    {
      if (v3)
        v6 = 4;
      else
        v6 = 0;
      *(_WORD *)&self->_deviceFlags = deviceFlags & 0xFFFB | v6;
      if ((deviceFlags & 2) != 0)
        objc_msgSend((id)UIApp, "setExpectsFaceContact:inLandscape:", 1, v3);
    }
  }
}

- (BOOL)proximityState
{
  return HIBYTE(*(_WORD *)&self->_deviceFlags) & 1;
}

- (void)_setActiveUserInterfaceIdiom:(int64_t)a3
{
  if (initializeActiveUserInterfaceIdiom_once != -1)
    dispatch_once(&initializeActiveUserInterfaceIdiom_once, &__block_literal_global_404);
  sActiveUserInterfaceIdiom = a3;
}

- (void)playInputClick
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  if (pthread_main_np() == 1)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v7, "keyClicksEnabled");
    v4 = v7;
    if (v3)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5 || (objc_msgSend(v5, "playInputClick") & 1) == 0)
        -[UIDevice _playSystemSound:](self, "_playSystemSound:", 1104);

      v4 = v7;
    }

  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Call must be made on main thread"));
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__UIDevice_playInputClick__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __26__UIDevice_playInputClick__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "playInputClick");
}

- (void)_setBacklightLevel:(float)a3
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  float v7;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__UIDevice__setBacklightLevel___block_invoke;
  v6[3] = &__block_descriptor_36_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  v7 = a3;
  objc_msgSend(v5, "_updateUIClientSettingsWithBlock:", v6);

}

uint64_t __31__UIDevice__setBacklightLevel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBrightnessLevel:", *(float *)(a1 + 32));
}

- (float)_softwareDimmingAlpha
{
  float result;

  MGGetFloat32Answer();
  return result;
}

+ (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;
  _QWORD block[5];

  if ((void *)_KVOContext == a6)
  {
    if (pthread_main_np() == 1)
    {
      objc_msgSend(a1, "invalidateSystemSoundEnablement");
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__UIDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___UIDevice;
    objc_msgSendSuper2(&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __59__UIDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateSystemSoundEnablement");
}

+ (void)invalidateSystemSoundEnablement
{
  __systemSoundEnabled = -1;
  if (qword_1ECD7E358)
  {
    if (CFArrayGetCount((CFArrayRef)qword_1ECD7E358) >= 1)
      UpdateSystemSoundActiveStatus();
  }
}

uint64_t __43__UIDevice__updateSystemSoundActiveStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSystemSoundActiveStatus:", *(_QWORD *)(a1 + 40));
}

- (void)_playSystemSound:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v3 = *(_QWORD *)&a3;
  if (IsSystemSoundEnabled())
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v4 = getAudioServicesPlaySystemSoundSymbolLoc_ptr;
    v11 = getAudioServicesPlaySystemSoundSymbolLoc_ptr;
    if (!getAudioServicesPlaySystemSoundSymbolLoc_ptr)
    {
      v5 = AudioToolboxLibrary_1();
      v4 = dlsym(v5, "AudioServicesPlaySystemSound");
      v9[3] = (uint64_t)v4;
      getAudioServicesPlaySystemSoundSymbolLoc_ptr = v4;
    }
    _Block_object_dispose(&v8, 8);
    if (v4)
    {
      ((void (*)(uint64_t))v4)(v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __AudioServicesPlaySystemSound(SystemSoundID)");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("UIDevice.m"), 93, CFSTR("%s"), dlerror());

      __break(1u);
    }
  }
}

- (void)_playInputSelectSound
{
  -[UIDevice _playSystemSound:](self, "_playSystemSound:", 1130);
}

- (void)_playInputDeleteSound
{
  -[UIDevice _playSystemSound:](self, "_playSystemSound:", 1131);
}

- (void)_hardwareKeyboardAvailabilityChanged
{
  int IsHardwareKeyboardAttached;
  __int16 deviceFlags;
  id v5;

  IsHardwareKeyboardAttached = GSEventIsHardwareKeyboardAttached();
  deviceFlags = (__int16)self->_deviceFlags;
  if ((IsHardwareKeyboardAttached != 0) == ((deviceFlags & 0x800) == 0))
  {
    *(_WORD *)&self->_deviceFlags = deviceFlags & 0xF7FF | ((IsHardwareKeyboardAttached != 0) << 11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification"), 0);

  }
}

- (void)_performShimmedRequestIfPossibleForDeviceOrientation:(int64_t)a3
{
  int IsValid;
  UIWindowSceneGeometryPreferencesIOS *v5;
  id v6;

  IsValid = BSInterfaceOrientationIsValid();
  if (a3 && IsValid)
  {
    +[_UISceneLifecycleMultiplexer mostActiveSceneWithTest:](_UISceneLifecycleMultiplexer, "mostActiveSceneWithTest:", &__block_literal_global_123_2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = objc_alloc_init(UIWindowSceneGeometryPreferencesIOS);
      -[UIWindowSceneGeometryPreferencesIOS setInterfaceOrientations:](v5, "setInterfaceOrientations:", 1 << a3);
      objc_msgSend(v6, "requestGeometryUpdateWithPreferences:errorHandler:", v5, 0);

    }
  }
}

uint64_t __65__UIDevice__performShimmedRequestIfPossibleForDeviceOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  if (objc_msgSend(v2, "activationState"))
  {
    isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (id)modelSpecificLocalizedStringKeyForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MGCopyAnswer();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasSuffix:", CFSTR("_SIMULATOR")))
  {
    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "rangeOfString:", CFSTR("_SIMULATOR")));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_hasTouchPad
{
  _BOOL4 v3;
  $75260331BB9513C2BC2474BE765B5109 deviceFlags;
  uint64_t state64;

  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_DeviceHasTouchPadOverride, (uint64_t)CFSTR("DeviceHasTouchPadOverride")) & 1) == 0&& byte_1ECD76584)
  {
    goto LABEL_3;
  }
  deviceFlags = self->_deviceFlags;
  if ((*(_WORD *)&deviceFlags & 0x200) != 0)
    return (*(unsigned int *)&deviceFlags >> 10) & 1;
  if (qword_1ECD7E360 != -1)
    dispatch_once(&qword_1ECD7E360, &__block_literal_global_237);
  if (dword_1ECD7E31C)
  {
    state64 = 0;
    notify_get_state(dword_1ECD7E31C, &state64);
    LOBYTE(v3) = state64 != 0;
  }
  else
  {
LABEL_3:
    LOBYTE(v3) = 1;
  }
  return v3;
}

const char *__41__UIDevice_UIDevicePrivate___hasTouchPad__block_invoke()
{
  const char *result;

  result = (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x1E0D00E28]), "UTF8String");
  if (result)
    return (const char *)notify_register_check(result, &dword_1ECD7E31C);
  return result;
}

- (void)_setHasTouchPad:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1536;
  else
    v3 = 512;
  *(_WORD *)&self->_deviceFlags = *(_WORD *)&self->_deviceFlags & 0xFBFF | v3;
}

void __58__UIDevice_UIDevicePrivate___loadRemoteDeviceInfoIfNeeded__block_invoke_2(uint64_t a1, int token)
{
  uint32_t state;
  uint32_t v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  const __CFString *v28;
  void *v29;
  uint64_t state64;
  uint8_t buf[4];
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  state = notify_get_state(token, &state64);
  if (state)
  {
    v4 = state;
    v5 = qword_1ECD7E368;
    if (!qword_1ECD7E368)
    {
      v5 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&qword_1ECD7E368);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v32) = v4;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Unable to get remote capabilities. status=%d", buf, 8u);
      }
    }
  }
  else
  {
    v7 = state64;
    v8 = 2;
    if ((state64 & 2) == 0)
      v8 = state64 & 1;
    v9 = *(_QWORD *)(a1 + 32);
    if (v8 != *(_QWORD *)(v9 + 24))
    {
      *(_QWORD *)(v9 + 24) = v8;
      v10 = qword_1ECD7E370;
      if (!qword_1ECD7E370)
      {
        v10 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&qword_1ECD7E370);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        v13 = CFSTR("Unknown");
        if (v12 == 1)
          v13 = CFSTR("Default");
        if (v12 == 2)
          v14 = CFSTR("Rotary");
        else
          v14 = (__CFString *)v13;
        v15 = v14;
        *(_DWORD *)buf = 138543362;
        v32 = v15;
        v16 = v11;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "Remote touch surface type has changed. Posting _UIDeviceRemoteTouchSurfaceTypeDidChangeNotification. remoteTouchSurfaceType=%{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:", CFSTR("_UIDeviceRemoteTouchSurfaceTypeDidChangeNotification"), 0);

      v9 = *(_QWORD *)(a1 + 32);
    }
    if (((v7 >> 3) & 1) != *(_BYTE *)(v9 + 32))
    {
      *(_BYTE *)(v9 + 32) = (v7 & 8) != 0;
      v18 = qword_1ECD7E378;
      if (!qword_1ECD7E378)
      {
        v18 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&qword_1ECD7E378);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
          v20 = CFSTR("YES");
        else
          v20 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v32 = v20;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, "Remote microphone capability has changed. Posting _UIDeviceRemoteHasMicrophoneDidChangeNotification. remoteHasMicrophone=%@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:", CFSTR("_UIDeviceRemoteHasMicrophoneDidChangeNotification"), 0);

      v9 = *(_QWORD *)(a1 + 32);
    }
    if (((v7 >> 2) & 1) != *(_BYTE *)(v9 + 33))
    {
      *(_BYTE *)(v9 + 33) = (v7 & 4) != 0;
      v22 = qword_1ECD7E380;
      if (!qword_1ECD7E380)
      {
        v22 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&qword_1ECD7E380);
      }
      v23 = *(NSObject **)(v22 + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33))
          v24 = CFSTR("YES");
        else
          v24 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v32 = v24;
        _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_DEFAULT, "Remote mute capability has changed. Posting _UIDeviceRemoteHasMuteDidChangeNotification. remoteHasMute=%@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "postNotificationName:object:", CFSTR("_UIDeviceRemoteHasMuteDidChangeNotification"), 0);

      v9 = *(_QWORD *)(a1 + 32);
    }
    if (((v7 >> 4) & 1) != *(_BYTE *)(v9 + 34))
    {
      *(_BYTE *)(v9 + 34) = (v7 & 0x10) != 0;
      v26 = qword_1ECD7E388;
      if (!qword_1ECD7E388)
      {
        v26 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v26, (unint64_t *)&qword_1ECD7E388);
      }
      v27 = *(NSObject **)(v26 + 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 34))
          v28 = CFSTR("YES");
        else
          v28 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v32 = v28;
        _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_DEFAULT, "Remote PushToTalk capability has changed. Posting _UIDeviceRemoteSupportsPushToTalkDidChangeNotification. remoteSupportsPushToTalk=%@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "postNotificationName:object:", CFSTR("_UIDeviceRemoteHasPushToTalkDidChangeNotification"), 0);

    }
  }
}

void __58__UIDevice_UIDevicePrivate___loadRemoteDeviceInfoIfNeeded__block_invoke_257(uint64_t a1, int token)
{
  uint32_t state;
  uint32_t v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  int v18;
  unint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  uint64_t state64;
  uint8_t buf[4];
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  state = notify_get_state(token, &state64);
  if (state)
  {
    v4 = state;
    v5 = qword_1ECD7E3C0;
    if (!qword_1ECD7E3C0)
    {
      v5 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&qword_1ECD7E3C0);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v4;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Unable to get remote type. status=%d", buf, 8u);
      }
    }
  }
  else
  {
    v7 = state64;
    if (state64 - 1 > 4)
      v8 = 0;
    else
      v8 = qword_18667E050[state64 - 1];
    v9 = *(_QWORD *)(a1 + 32);
    if (v8 != *(_QWORD *)(v9 + 24))
    {
      *(_QWORD *)(v9 + 24) = v8;
      v10 = qword_1ECD7E3C8;
      if (!qword_1ECD7E3C8)
      {
        v10 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&qword_1ECD7E3C8);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        v13 = CFSTR("Unknown");
        if (v12 == 1)
          v13 = CFSTR("Default");
        if (v12 == 2)
          v14 = CFSTR("Rotary");
        else
          v14 = (__CFString *)v13;
        v15 = v14;
        *(_DWORD *)buf = 138543362;
        v25 = v15;
        v16 = v11;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "Remote touch surface type has changed. Posting _UIDeviceRemoteTouchSurfaceTypeDidChangeNotification. remoteTouchSurfaceType=%{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:", CFSTR("_UIDeviceRemoteTouchSurfaceTypeDidChangeNotification"), 0);

      v7 = state64;
      v9 = *(_QWORD *)(a1 + 32);
    }
    v18 = v7 - 1 < 5;
    if (*(unsigned __int8 *)(v9 + 32) != v18)
    {
      *(_BYTE *)(v9 + 32) = v18;
      v19 = qword_1ECD7E3D0;
      if (!qword_1ECD7E3D0)
      {
        v19 = __UILogCategoryGetNode("Device", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1ECD7E3D0);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
          v21 = CFSTR("YES");
        else
          v21 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v25 = v21;
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "Remote microphone capability has changed. Posting _UIDeviceRemoteHasMicrophoneDidChangeNotification. remoteHasMicrophone=%@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postNotificationName:object:", CFSTR("_UIDeviceRemoteHasMicrophoneDidChangeNotification"), 0);

    }
  }
}

- (unint64_t)_remoteTouchSurfaceType
{
  -[UIDevice _loadRemoteDeviceInfoIfNeeded](self, "_loadRemoteDeviceInfoIfNeeded");
  return self->_remoteTouchSurfaceType;
}

- (BOOL)_hasGraphicsQualityOverride
{
  return 0;
}

+ (BOOL)_isLowEnd
{
  if (qword_1ECD7E400 != -1)
    dispatch_once(&qword_1ECD7E400, &__block_literal_global_290_0);
  return byte_1ECD7E30E;
}

uint64_t __39__UIDevice_UIDeviceInternal___isLowEnd__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECD7E30E = result;
  return result;
}

- (int64_t)_nativeScreenGamut
{
  if (qword_1ECD7E418 != -1)
    dispatch_once(&qword_1ECD7E418, &__block_literal_global_296);
  return qword_1ECD7E410;
}

uint64_t __48__UIDevice_UIDeviceInternal___nativeScreenGamut__block_invoke()
{
  uint64_t result;

  result = CUIGetDeviceArtworkDisplayGamut();
  qword_1ECD7E410 = result;
  return result;
}

- (BOOL)_supportsPushToTalk
{
  -[UIDevice _loadRemoteDeviceInfoIfNeeded](self, "_loadRemoteDeviceInfoIfNeeded");
  return self->_remoteSupportsPushToTalk;
}

@end
