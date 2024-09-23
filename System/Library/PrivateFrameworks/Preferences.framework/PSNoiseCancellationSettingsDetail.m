@implementation PSNoiseCancellationSettingsDetail

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Bluetooth"));
}

+ (id)iconImage
{
  return 0;
}

+ (void)setEnabled:(BOOL)a3
{
  void *v3;
  id v4;

  PSConnected298();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    PSBTSetAccessoryListeningMode(v3);
    v3 = v4;
  }

}

+ (BOOL)isEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  PSConnected298();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = PSBTAccessoryListeningMode(v2) == 2;
  else
    v4 = 0;

  return v4;
}

@end
