@implementation _DASBatteryTemperatureReader

+ (id)batteryProperties
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  CFMutableDictionaryRef properties;

  v2 = IOServiceMatching((const char *)objc_msgSend(CFSTR("IOPMPowerSource"), "UTF8String"));
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (!MatchingService)
    return 0;
  properties = 0;
  if (IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0))
    return 0;
  else
    return properties;
}

- (id)currentValue
{
  void *v2;
  NSObject *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBatteryTemperatureReader batteryProperties](_DASBatteryTemperatureReader, "batteryProperties"));
  v3 = os_log_create("com.apple.clas", "signals");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1000E0E70(v2, v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Temperature")));
  return v4;
}

- (id)lastModifiedDate
{
  return 0;
}

@end
