@implementation SPApplicationsInitClient

void __SPApplicationsInitClient_block_invoke()
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v1;
  __CFNotificationCenter *v2;
  __CFNotificationCenter *DarwinNotifyCenter;

  SBSRegisterDisplayIdentifiersChangedBlock();
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)SPAppsChangedNotificationClient, CFSTR("com.apple.LaunchServices.applicationStateChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v1 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v1, 0, (CFNotificationCallback)SPAppsChangedNotificationClient, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v2, 0, (CFNotificationCallback)SPAppsChangedNotificationClient, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)SPAppsChangedNotificationClient, (CFStringRef)*MEMORY[0x24BDC14C8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void __SPApplicationsInitClient_block_invoke_2()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (sAppsChangedBlock)
  {
    (*(void (**)(void))(sAppsChangedBlock + 16))();
  }
  else
  {
    v0 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v0)
      __SPApplicationsInitClient_block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void __SPApplicationsInitClient_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_213202000, MEMORY[0x24BDACB70], a3, "Apps changed block wasn't set", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

@end
