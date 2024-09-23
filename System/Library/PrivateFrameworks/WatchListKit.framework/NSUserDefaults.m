@implementation NSUserDefaults

void __48__NSUserDefaults_WLKAdditions__wlk_userDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.WatchListKit"));
  v1 = (void *)wlk_userDefaults___wlkDefaults;
  wlk_userDefaults___wlkDefaults = v0;

}

@end
