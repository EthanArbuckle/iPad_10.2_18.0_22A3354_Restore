@implementation NSStringToWFTemperatureUnit

uint64_t __NSStringToWFTemperatureUnit_block_invoke()
{
  uint64_t result;

  NSStringToWFTemperatureUnit_fahrenheitHash = objc_msgSend(CFSTR("WFTemperatureUnitFahrenheit"), "hash");
  NSStringToWFTemperatureUnit_kelvinHash = objc_msgSend(CFSTR("WFTemperatureUnitKelvin"), "hash");
  result = objc_msgSend(CFSTR("WFTemperatureUnitCelsius"), "hash");
  NSStringToWFTemperatureUnit_celsiusHash = result;
  return result;
}

@end
