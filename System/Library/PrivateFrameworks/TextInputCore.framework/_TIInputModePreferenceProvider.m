@implementation _TIInputModePreferenceProvider

- (id)enabledInputModeIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledInputModeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "copy");
  return v4;
}

- (id)defaultEnabledInputModesForCurrentLocale
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultEnabledInputModesForCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "copy");
  return v4;
}

@end
