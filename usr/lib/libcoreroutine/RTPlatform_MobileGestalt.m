@implementation RTPlatform_MobileGestalt

- (BOOL)internalInstall
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;

  v2 = (const __CFBoolean *)MGCopyAnswer();
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) == 1;
  CFRelease(v3);
  return v5;
}

- (RTPlatform_MobileGestalt)init
{
  RTNanoRegistry *v3;
  void *v4;
  RTPlatform_MobileGestalt *v5;

  v3 = objc_alloc_init(RTNanoRegistry);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTPlatform_MobileGestalt initWithNanoRegistry:userDefaults:](self, "initWithNanoRegistry:userDefaults:", v3, v4);

  return v5;
}

- (RTPlatform_MobileGestalt)initWithNanoRegistry:(id)a3 userDefaults:(id)a4
{
  id v7;
  id v8;
  RTPlatform_MobileGestalt *v9;
  id *p_isa;
  RTPlatform_MobileGestalt *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)RTPlatform_MobileGestalt;
    v9 = -[RTPlatform_MobileGestalt init](&v14, sel_init);
    p_isa = (id *)&v9->super.super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_userDefaults, a4);
      objc_storeStrong(p_isa + 2, a3);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTPlatform_MobileGestalt initWithNanoRegistry:userDefaults:]";
      v17 = 1024;
      v18 = 41;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: userDefaults (in %s:%d)", buf, 0x12u);
    }

    v11 = 0;
  }

  return v11;
}

- (id)userAssignedDeviceName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MGCopyAnswer();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3698], "currentHost");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(v3, "name");
    else
      +[RTSystemControl valueForKey:](RTSystemControl, "valueForKey:", CFSTR("kern.hostname"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)productType
{
  return (id)MGCopyAnswer();
}

- (id)systemVersion
{
  return (id)MGCopyAnswer();
}

- (BOOL)lowEndHardware
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;

  v2 = (const __CFBoolean *)MGCopyAnswer();
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) == 1;
  CFRelease(v3);
  return v5;
}

- (BOOL)supportsCoreRoutineCapability
{
  __CFString *v2;
  NSObject *v3;
  int v4;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  CFTypeID v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("OverrideCoreRoutineSupported"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v2;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "CoreRoutine capabiltiy overridden, %@", (uint8_t *)&v11, 0xCu);
    }

    v4 = -[__CFString BOOLValue](v2, "BOOLValue");
  }
  else
  {
    v5 = (const __CFBoolean *)MGCopyAnswer();
    if (v5)
    {
      v6 = v5;
      v7 = CFGetTypeID(v5);
      v4 = v7 == CFBooleanGetTypeID() && CFBooleanGetValue(v6) != 0;
      CFRelease(v6);
    }
    else
    {
      v4 = 0;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = CFSTR("NO");
    if (v4)
      v9 = CFSTR("YES");
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "supports CoreRoutine capabiltiy, %@", (uint8_t *)&v11, 0xCu);
  }

  return v4;
}

- (BOOL)supportsMultiUser
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ForceMultiUser"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v11 = CFSTR("YES");
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "multi user overridden, %@", buf, 0xCu);
    }

    v4 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    v5 = (void *)MKBUserTypeDeviceMode();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D4E5A0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D4E5A8]);

  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "supports multi user, %@", buf, 0xCu);
  }

  return v4;
}

- (id)systemModel
{
  return (id)MGCopyAnswer();
}

- (id)deviceClass
{
  return (id)MGCopyAnswer();
}

- (BOOL)simulatorPlatform
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;

  v2 = (const __CFBoolean *)MGCopyAnswer();
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) == 1;
  CFRelease(v3);
  return v5;
}

- (BOOL)iPhonePlatform
{
  void *v2;
  void *v3;
  BOOL v4;

  -[RTPlatform_MobileGestalt deviceClass](self, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = v2
    && ((objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone")) & 1) != 0
     || (objc_msgSend(v3, "isEqualToString:", CFSTR("iPad")) & 1) != 0
     || objc_msgSend(v3, "isEqualToString:", CFSTR("iPod")));

  return v4;
}

- (BOOL)watchPlatform
{
  void *v2;
  void *v3;
  char v4;

  -[RTPlatform_MobileGestalt deviceClass](self, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isEqualToString:", CFSTR("Watch"));
  else
    v4 = 0;

  return v4;
}

- (BOOL)macOSPlatform
{
  return 0;
}

- (BOOL)iPhoneDevice
{
  void *v2;
  void *v3;
  char v4;

  -[RTPlatform_MobileGestalt deviceClass](self, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone"));
  else
    v4 = 0;

  return v4;
}

- (BOOL)realityDevice
{
  void *v2;
  void *v3;
  char v4;

  -[RTPlatform_MobileGestalt deviceClass](self, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isEqualToString:", CFSTR("RealityDevice"));
  else
    v4 = 0;

  return v4;
}

- (BOOL)supportsScenarioTriggers
{
  return 1;
}

- (BOOL)isWatchPaired
{
  return -[RTNanoRegistry isWatchPaired](self->_nanoRegistry, "isWatchPaired");
}

- (BOOL)isTinkerPaired
{
  return -[RTNanoRegistry isTinkerPaired](self->_nanoRegistry, "isTinkerPaired");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nanoRegistry, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
