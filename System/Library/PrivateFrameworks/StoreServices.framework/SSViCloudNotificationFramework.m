@implementation SSViCloudNotificationFramework

void *__SSViCloudNotificationFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/iCloudNotification.framework/iCloudNotification", 1);
  SSViCloudNotificationFramework_sHandle = (uint64_t)result;
  return result;
}

@end
