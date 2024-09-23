@implementation WeatherInternalPreferences

+ (id)sharedInternalPreferences
{
  if (sharedInternalPreferences_onceToken != -1)
    dispatch_once(&sharedInternalPreferences_onceToken, &__block_literal_global_13);
  return (id)sharedInternalPreferences_sharedInternalPreferences;
}

void __55__WeatherInternalPreferences_sharedInternalPreferences__block_invoke()
{
  WeatherInternalPreferences *v0;
  void *v1;

  v0 = -[WeatherInternalPreferences initWithSuiteName:]([WeatherInternalPreferences alloc], "initWithSuiteName:", CFSTR("com.apple.weather.internal"));
  v1 = (void *)sharedInternalPreferences_sharedInternalPreferences;
  sharedInternalPreferences_sharedInternalPreferences = (uint64_t)v0;

}

- (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1)
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_1);
  return isInternalInstall___isInternalInstall;
}

uint64_t __47__WeatherInternalPreferences_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isInternalInstall___isInternalInstall = result;
  return result;
}

- (BOOL)isV3Enabled
{
  void *v2;
  void *v3;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("apiVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("twc_v3"));
  return (char)v2;
}

- (BOOL)shouldShowUpdateTimestamp
{
  void *v2;
  char v3;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("forceUpdateTimeShown"));

  return v3;
}

- (unint64_t)deviceInactivityThreshold
{
  void *v2;
  unint64_t v3;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("feature.manateeMigration.deviceInactivityThreshold"));

  return v3;
}

- (WeatherPreferencesPersistence)persistence
{
  return (WeatherPreferencesPersistence *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPersistence:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
}

@end
