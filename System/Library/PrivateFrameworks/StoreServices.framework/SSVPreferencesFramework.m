@implementation SSVPreferencesFramework

void *__SSVPreferencesFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Preferences.framework/Preferences", 1);
  SSVPreferencesFramework_sHandle = (uint64_t)result;
  return result;
}

@end
