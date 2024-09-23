@implementation PSCellularDataSettingsDetail

+ (BOOL)isEnabled
{
  return CTCellularDataPlanGetIsEnabled() != 0;
}

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=MOBILE_DATA_SETTINGS_ID"));
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithTypeIdentifier:", CFSTR("com.apple.graphic-icon.cellular-settings"));
}

+ (void)setEnabled:(BOOL)a3
{
  CTCellularDataPlanSetIsEnabled();
}

+ (BOOL)deviceSupportsCellularData
{
  return MGGetBoolAnswer();
}

@end
