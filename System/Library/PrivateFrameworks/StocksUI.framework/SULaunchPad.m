@implementation SULaunchPad

+ (void)launchSettings
{
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "openApplication:options:withResult:", CFSTR("com.apple.Preferences"), 0, 0);

}

+ (void)openStocksSettings
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=STOCKS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

}

@end
