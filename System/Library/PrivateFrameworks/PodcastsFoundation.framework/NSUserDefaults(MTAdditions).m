@implementation NSUserDefaults(MTAdditions)

+ (id)_applePodcastsFoundationSettingsUserDefaults
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "appUserDefaultsForUnitTesting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "appUserDefaultsForUnitTesting");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(a1, "shouldReadSettingsFromSharedUserDefaults"))
      objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
    else
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)_applePodcastsFoundationSharedUserDefaults
{
  if (_applePodcastsFoundationSharedUserDefaults_onceToken != -1)
    dispatch_once(&_applePodcastsFoundationSharedUserDefaults_onceToken, &__block_literal_global_1);
  return (id)_applePodcastsFoundationSharedUserDefaults_defaults;
}

+ (uint64_t)shouldReadSettingsFromSharedUserDefaults
{
  if ((objc_msgSend(a1, "settingsAppWritesDirectlyToSharedUserDefaults") & 1) != 0)
    return 1;
  else
    return +[PFClientUtil isPodcastsApp](PFClientUtil, "isPodcastsApp") ^ 1;
}

+ (uint64_t)settingsAppWritesDirectlyToSharedUserDefaults
{
  return 1;
}

@end
