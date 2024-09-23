@implementation NSUserDefaults

void __58__NSUserDefaults_SafariCoreExtras__safari_browserDefaults__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_safari_browserDefaults");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)safari_browserDefaults_userDefaults;
  safari_browserDefaults_userDefaults = v1;

}

void __93__NSUserDefaults_SafariCoreExtras__safari_standardUserDefaultsWithOptimizedKeyValueObserving__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = -[_WBSOptimizedKeyValueObservingUserDefaults _initWithSuiteName:container:]([_WBSOptimizedKeyValueObservingUserDefaults alloc], "_initWithSuiteName:container:", 0, 0);
  v1 = (void *)safari_standardUserDefaultsWithOptimizedKeyValueObserving_userDefaults;
  safari_standardUserDefaultsWithOptimizedKeyValueObserving_userDefaults = v0;

}

void __59__NSUserDefaults_SafariCoreExtras__sf_safariSharedDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobilesafarishared"));
  v1 = (void *)sf_safariSharedDefaults_safariSharedDefaults;
  sf_safariSharedDefaults_safariSharedDefaults = v0;

}

void __47__NSUserDefaults_SafariCoreExtras__pm_defaults__block_invoke()
{
  void *v0;
  int v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "safari_isPasswordsAppBundle");

  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)pm_defaults_userDefaults;
    pm_defaults_userDefaults = v2;
  }
  else
  {
    WBSSetUpAccessToAppDataContainerWithIdentifier(CFSTR("com.apple.Passwords"));
    v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_passwordsAppContainerDirectoryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "_initWithSuiteName:container:", CFSTR("com.apple.Passwords"), v5);
    v7 = (void *)pm_defaults_userDefaults;
    pm_defaults_userDefaults = v6;

    v3 = v8;
  }

}

void __65__NSUserDefaults_SafariCoreExtras__safari_cloudBookmarksDefaults__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.SafariBookmarksSyncAgent"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithSuiteName:", CFSTR("com.apple.SafariBookmarksSyncAgent"));
  }
  v6 = (void *)safari_cloudBookmarksDefaults_defaults;
  safari_cloudBookmarksDefaults_defaults = v5;

}

@end
