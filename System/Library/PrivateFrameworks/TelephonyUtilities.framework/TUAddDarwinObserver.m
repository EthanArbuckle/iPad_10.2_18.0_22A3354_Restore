@implementation TUAddDarwinObserver

void __TUAddDarwinObserver_block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), *(CFNotificationCallback *)(a1 + 40), *(CFStringRef *)(a1 + 48), *(const void **)(a1 + 56), *(CFNotificationSuspensionBehavior *)(a1 + 64));
}

@end
