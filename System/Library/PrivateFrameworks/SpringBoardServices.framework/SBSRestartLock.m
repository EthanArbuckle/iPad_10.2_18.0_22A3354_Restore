@implementation SBSRestartLock

void ___SBSRestartLock_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v0 = objc_alloc_init(MEMORY[0x1E0CB38E0]);
  v1 = (void *)__SBSRestartLock;
  __SBSRestartLock = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)__SBSRestartBlocks;
  __SBSRestartBlocks = (uint64_t)v2;

  __SBSRestartInfo = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_SBSRestarted, CFSTR("SBSpringBoardDidLaunchNotification"), 0, (CFNotificationSuspensionBehavior)0);
}

@end
