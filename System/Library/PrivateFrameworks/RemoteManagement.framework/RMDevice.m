@implementation RMDevice

+ (RMDevice)currentDevice
{
  if (currentDevice_onceToken != -1)
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_4_0);
  return (RMDevice *)(id)currentDevice_currentDevice;
}

void __25__RMDevice_currentDevice__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)currentDevice_currentDevice;
  currentDevice_currentDevice = v0;

}

- (NSString)UDID
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  queryGestalt((uint64_t)CFSTR("UniqueDeviceID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMFeatureOverrides internalStatusForKey:defaultValue:](RMFeatureOverrides, "internalStatusForKey:defaultValue:", CFSTR("UniqueDeviceID"), v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &stru_24D968E30;
  v5 = v4;

  return v5;
}

- (NSString)serialNumber
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  queryGestalt((uint64_t)CFSTR("SerialNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMFeatureOverrides internalStatusForKey:defaultValue:](RMFeatureOverrides, "internalStatusForKey:defaultValue:", CFSTR("SerialNumber"), v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &stru_24D968E30;
  v5 = v4;

  return v5;
}

- (NSNumber)chipID
{
  void *v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  queryGestalt((uint64_t)CFSTR("ChipID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMFeatureOverrides internalStatusForKey:defaultValue:](RMFeatureOverrides, "internalStatusForKey:defaultValue:", CFSTR("ChipID"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &unk_24D96E6E8;
  v5 = v4;

  return v5;
}

- (NSString)modelFamily
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  queryGestalt((uint64_t)CFSTR("DeviceClass"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMFeatureOverrides internalStatusForKey:defaultValue:](RMFeatureOverrides, "internalStatusForKey:defaultValue:", CFSTR("DeviceClass"), v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &stru_24D968E30;
  v5 = v4;

  return v5;
}

- (NSString)modelIdentifier
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  queryGestalt((uint64_t)CFSTR("ProductType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMFeatureOverrides internalStatusForKey:defaultValue:](RMFeatureOverrides, "internalStatusForKey:defaultValue:", CFSTR("ProductType"), v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &stru_24D968E30;
  v5 = v4;

  return v5;
}

- (NSString)modelMarketingName
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  queryGestalt((uint64_t)CFSTR("marketing-name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMFeatureOverrides internalStatusForKey:defaultValue:](RMFeatureOverrides, "internalStatusForKey:defaultValue:", CFSTR("marketing-name"), v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &stru_24D968E30;
  v5 = v4;

  return v5;
}

- (NSString)modelNumber
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;

  queryGestalt((uint64_t)CFSTR("ModelNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMFeatureOverrides internalStatusForKey:defaultValue:](RMFeatureOverrides, "internalStatusForKey:defaultValue:", CFSTR("ModelNumber"), v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &stru_24D968E30;
  v5 = v4;

  queryGestalt((uint64_t)CFSTR("RegionInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMFeatureOverrides internalStatusForKey:defaultValue:](RMFeatureOverrides, "internalStatusForKey:defaultValue:", CFSTR("RegionInfo"), v6);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = &stru_24D968E30;
  v9 = v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)operatingSystem
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  queryGestalt((uint64_t)CFSTR("j9Th5smJpdztHwc+i39zIg"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMFeatureOverrides internalStatusForKey:defaultValue:](RMFeatureOverrides, "internalStatusForKey:defaultValue:", CFSTR("j9Th5smJpdztHwc+i39zIg"), v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &stru_24D968E30;
  v5 = v4;

  return v5;
}

- (NSString)operatingSystemMarketingName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[RMDevice operatingSystem](self, "operatingSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMDevice operatingSystemVersion](self, "operatingSystemVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)operatingSystemVersion
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  queryGestalt((uint64_t)CFSTR("ProductVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMFeatureOverrides internalStatusForKey:defaultValue:](RMFeatureOverrides, "internalStatusForKey:defaultValue:", CFSTR("ProductVersion"), v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &stru_24D968E30;
  v5 = v4;

  return v5;
}

- (NSString)operatingSystemSupplementalExtraVersion
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  queryGestalt((uint64_t)CFSTR("ProductVersionExtra"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMFeatureOverrides internalStatusForKey:defaultValue:](RMFeatureOverrides, "internalStatusForKey:defaultValue:", CFSTR("ProductVersionExtra"), v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &stru_24D968E30;
  v5 = v4;

  return v5;
}

- (NSString)operatingSystemBuildVersion
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  queryGestalt((uint64_t)CFSTR("BuildVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMFeatureOverrides internalStatusForKey:defaultValue:](RMFeatureOverrides, "internalStatusForKey:defaultValue:", CFSTR("BuildVersion"), v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &stru_24D968E30;
  v5 = v4;

  return v5;
}

- (NSString)operatingSystemSupplementalBuildVersion
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  queryGestalt((uint64_t)CFSTR("SupplementalBuildVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMFeatureOverrides internalStatusForKey:defaultValue:](RMFeatureOverrides, "internalStatusForKey:defaultValue:", CFSTR("SupplementalBuildVersion"), v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &stru_24D968E30;
  v5 = v4;

  return v5;
}

- (BOOL)hasSEP
{
  return +[RMFeatureOverrides internalStatusForKey:defaultBool:](RMFeatureOverrides, "internalStatusForKey:defaultBool:", CFSTR("HasSEP"), MGGetBoolAnswer());
}

- (BOOL)locked
{
  int v2;
  NSObject *v3;
  BOOL v4;

  v2 = MKBGetDeviceLockState();
  +[RMLog device](RMLog, "device");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[RMDevice locked].cold.1(v2, v3);

  if (v2)
    v4 = v2 == 3;
  else
    v4 = 1;
  return !v4;
}

- (void)locked
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_21885E000, a2, OS_LOG_TYPE_DEBUG, "Lock state %d", (uint8_t *)v2, 8u);
}

@end
