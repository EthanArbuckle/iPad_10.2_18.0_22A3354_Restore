@implementation UserNotificationsSettingsLibrary

void *__UserNotificationsSettingsLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/UserNotificationsSettings.framework/UserNotificationsSettings", 2);
  UserNotificationsSettingsLibrary_sLib = (uint64_t)result;
  return result;
}

@end
