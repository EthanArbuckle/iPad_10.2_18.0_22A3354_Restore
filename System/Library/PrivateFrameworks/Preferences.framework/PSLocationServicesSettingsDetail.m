@implementation PSLocationServicesSettingsDetail

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Privacy&path=LOCATION"));
}

+ (void)setEnabled:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0C9E3C8], "setLocationServicesEnabled:", a3);
}

+ (BOOL)isEnabled
{
  return objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled");
}

+ (id)iconImage
{
  return 0;
}

@end
