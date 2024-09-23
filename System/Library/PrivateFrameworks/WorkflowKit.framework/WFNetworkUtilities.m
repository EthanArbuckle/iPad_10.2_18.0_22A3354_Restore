@implementation WFNetworkUtilities

+ (BOOL)isAirplaneModeEnabled
{
  uint64_t (*v2)();

  v2 = softLinkSCPreferencesCreate(*MEMORY[0x1E0C9AE00], (uint64_t)CFSTR("com.apple.wifikit"), (uint64_t)CFSTR("com.apple.radios.plist"));
  return objc_msgSend(softLinkSCPreferencesGetValue((uint64_t)v2, (uint64_t)CFSTR("AirplaneMode")), "BOOLValue");
}

@end
