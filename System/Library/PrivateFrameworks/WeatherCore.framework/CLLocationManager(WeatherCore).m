@implementation CLLocationManager(WeatherCore)

+ (uint64_t)wc_authorizationStatus
{
  return objc_msgSend(MEMORY[0x1E0C9E3C8], "authorizationStatusForBundleIdentifier:", CFSTR("com.apple.weather"));
}

@end
