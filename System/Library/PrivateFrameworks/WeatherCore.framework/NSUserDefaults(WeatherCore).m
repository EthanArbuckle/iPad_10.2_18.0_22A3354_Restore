@implementation NSUserDefaults(WeatherCore)

+ (id)wc_userDefaultsWithSuiteName:()WeatherCore backupDisabled:
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSuiteName:", v4);
  _CFPreferencesSetBackupDisabled();

  return v5;
}

@end
