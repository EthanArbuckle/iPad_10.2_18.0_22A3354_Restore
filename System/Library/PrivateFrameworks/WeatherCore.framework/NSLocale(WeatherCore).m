@implementation NSLocale(WeatherCore)

+ (uint64_t)wc_setPreferredTemperatureUnit:()WeatherCore
{
  return objc_msgSend(MEMORY[0x1E0C99DC8], "_setPreferredTemperatureUnit:");
}

@end
