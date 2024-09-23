@implementation WeatherFoundationInternalUserDefaults

void __WeatherFoundationInternalUserDefaults_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.weather.internal"));
  v1 = (void *)WeatherFoundationInternalUserDefaults_result;
  WeatherFoundationInternalUserDefaults_result = v0;

  if (!WeatherFoundationInternalUserDefaults_result)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)WeatherFoundationInternalUserDefaults_result;
    WeatherFoundationInternalUserDefaults_result = v2;

  }
}

@end
