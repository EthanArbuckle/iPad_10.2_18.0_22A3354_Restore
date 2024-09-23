@implementation NSUserDefaults(WLKAdditions)

+ (id)wlk_userDefaults
{
  if (wlk_userDefaults_onceToken != -1)
    dispatch_once(&wlk_userDefaults_onceToken, &__block_literal_global_33);
  return (id)wlk_userDefaults___wlkDefaults;
}

@end
