@implementation RTPlatform

+ (id)currentPlatform
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__RTPlatform_currentPlatform__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_103 != -1)
    dispatch_once(&_MergedGlobals_103, block);
  return (id)qword_1ED9429F8;
}

void __29__RTPlatform_currentPlatform__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED9429F8;
  qword_1ED9429F8 = v0;

}

+ (RTPlatform)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (RTPlatform *)+[RTPlatform allocWithZone:](RTPlatform_MobileGestalt, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RTPlatform;
  return (RTPlatform *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)userAssignedDeviceName
{
  return +[RTSystemControl valueForKey:](RTSystemControl, "valueForKey:", CFSTR("kern.hostname"));
}

- (id)productType
{
  return +[RTSystemControl valueForKey:](RTSystemControl, "valueForKey:", CFSTR("hw.model"));
}

- (BOOL)internalInstall
{
  return 0;
}

- (id)buildVersion
{
  void *v2;
  void *v3;

  v2 = (void *)_CFCopyServerVersionDictionary();
  if (v2 || (v2 = (void *)_CFCopySystemVersionDictionary()) != 0)
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C9AB90]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)systemVersion
{
  void *v2;
  void *v3;

  v2 = (void *)_CFCopyServerVersionDictionary();
  if (v2 || (v2 = (void *)_CFCopySystemVersionDictionary()) != 0)
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C9ABB0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)serialNumber
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  CFTypeRef CFProperty;
  void *v7;
  void *v8;

  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    v5 = MatchingService;
    CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IOPlatformSerialNumber"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v7 = (void *)CFProperty;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", CFProperty);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    IOObjectRelease(v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)systemModel
{
  return CFSTR("Unknown");
}

- (BOOL)lowEndHardware
{
  return 0;
}

- (BOOL)supportsCoreRoutineCapability
{
  return 0;
}

- (BOOL)supportsMultiUser
{
  return 0;
}

- (id)deviceClass
{
  return +[RTSystemControl valueForKey:](RTSystemControl, "valueForKey:", CFSTR("hw.targettype"));
}

- (unint64_t)deviceMemorySize
{
  return +[RTSystemControl sysctlByName:](RTSystemControl, "sysctlByName:", CFSTR("hw.memsize"));
}

+ (BOOL)version:(id *)a3 equalToVersion:(id *)a4
{
  return a3->var0 == a4->var0 && a3->var1 == a4->var1 && a3->var2 == a4->var2;
}

+ (BOOL)version:(id *)a3 noGreaterThanVersion:(id *)a4
{
  int64_t var1;
  int64_t v5;

  if (a3->var0 > a4->var0)
    return 0;
  if (a3->var0 < a4->var0)
    return 1;
  var1 = a3->var1;
  v5 = a4->var1;
  if (var1 > v5)
    return 0;
  return var1 < v5 || a3->var2 <= a4->var2;
}

+ (BOOL)operatingSystemNoGreaterThanVersion:(id *)a3
{
  void *v4;
  void *v5;
  int64_t var1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "operatingSystemVersion");

  if (a3->var0 < 0)
    return 0;
  if (a3->var0 > 0)
    return 1;
  var1 = a3->var1;
  if (var1 < 0)
    return 0;
  return var1 > 0 || a3->var2 >= 0;
}

+ (BOOL)operatingSystemAtLeastVersion:(id *)a3
{
  void *v4;
  void *v5;
  int64_t var1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "operatingSystemVersion");

  if (a3->var0 > 0)
    return 0;
  if (a3->var0 < 0)
    return 1;
  var1 = a3->var1;
  if (var1 > 0)
    return 0;
  return var1 < 0 || a3->var2 <= 0;
}

+ (BOOL)version:(id *)a3 atLeastVersion:(id *)a4
{
  int64_t var1;
  int64_t v5;

  if (a3->var0 < a4->var0)
    return 0;
  if (a3->var0 > a4->var0)
    return 1;
  var1 = a3->var1;
  v5 = a4->var1;
  if (var1 < v5)
    return 0;
  return var1 > v5 || a3->var2 >= a4->var2;
}

+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersionFromString:(SEL)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "+[RTPlatform operatingSystemVersionFromString:]";
      v16 = 1024;
      v17 = 249;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: versionString (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }

  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v7, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    retstr->var0 = objc_msgSend(v10, "integerValue");

    if (v9 != 1)
    {
      objc_msgSend(v7, "objectAtIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      retstr->var1 = objc_msgSend(v11, "integerValue");

      if (v9 >= 3)
      {
        objc_msgSend(v7, "objectAtIndex:", 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        retstr->var2 = objc_msgSend(v12, "integerValue");

      }
    }
  }

  return result;
}

- (BOOL)simulatorPlatform
{
  return 0;
}

- (BOOL)iPhonePlatform
{
  return 0;
}

- (BOOL)watchPlatform
{
  return 0;
}

- (BOOL)macOSPlatform
{
  return 0;
}

- (BOOL)iPhoneDevice
{
  return 0;
}

- (BOOL)realityDevice
{
  return 0;
}

- (BOOL)supportsPairedDevice
{
  return 0;
}

- (BOOL)paired
{
  return 0;
}

- (BOOL)supportsScenarioTriggers
{
  return 0;
}

- (BOOL)isWatchPaired
{
  return 0;
}

- (BOOL)usesTSCForClustering
{
  return 1;
}

- (BOOL)isTinkerPaired
{
  return 0;
}

@end
