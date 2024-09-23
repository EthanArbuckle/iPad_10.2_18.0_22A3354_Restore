@implementation NSUserDefaults

void __73__NSUserDefaults_MTAdditions___applePodcastsFoundationSharedUserDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  +[MTConstants sharedContainerURL](MTConstants, "sharedContainerURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "_initWithSuiteName:container:", CFSTR("243LU875E5.groups.com.apple.podcasts"), v4);
  v1 = (void *)_applePodcastsFoundationSharedUserDefaults_defaults;
  _applePodcastsFoundationSharedUserDefaults_defaults = v0;

  v2 = (void *)_applePodcastsFoundationSharedUserDefaults_defaults;
  +[MTPreferences defaultSettings](MTPreferences, "defaultSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerDefaults:", v3);

}

@end
