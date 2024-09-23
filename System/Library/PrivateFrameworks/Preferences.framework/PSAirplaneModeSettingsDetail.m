@implementation PSAirplaneModeSettingsDetail

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ROOT#AIRPLANE_MODE"));
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithTypeIdentifier:", CFSTR("com.apple.graphic-icon.airplane-mode"));
}

+ (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CFA9B8]);
  objc_msgSend(v4, "setAirplaneMode:", v3);

}

+ (BOOL)isEnabled
{
  id v2;
  char v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CFA9B8]);
  v3 = objc_msgSend(v2, "airplaneMode");

  return v3;
}

@end
