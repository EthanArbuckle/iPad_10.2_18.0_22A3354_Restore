@implementation URTAlertCreateRunLoopSource

uint64_t __URTAlertCreateRunLoopSource_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUserNotificationResponse:");
}

@end
