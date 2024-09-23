@implementation SPApplicationsInit

void __SPApplicationsInit_block_invoke()
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v1;
  __CFNotificationCenter *v2;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (SPApplicationsBasicInit_onceToken != -1)
    dispatch_once(&SPApplicationsBasicInit_onceToken, &__block_literal_global_147);
  SBSRegisterDisplayIdentifiersChangedBlock();
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)SPBuildApplicationsNotification, CFSTR("com.apple.LaunchServices.applicationStateChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v1 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v1, 0, (CFNotificationCallback)SPBuildApplicationsNotification, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v2, 0, (CFNotificationCallback)SPBuildApplicationsNotification, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)SPBuildApplicationsNotification, (CFStringRef)*MEMORY[0x24BDC14C8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void __SPApplicationsInit_block_invoke_2()
{
  void *v0;
  uint8_t v1[16];

  v0 = (void *)MEMORY[0x2199AE17C]();
  kdebug_trace();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "SBSRegisterDisplayIdentifiersChanged", v1, 2u);
  }
  dispatch_source_merge_data((dispatch_source_t)sSource, 2uLL);
  objc_autoreleasePoolPop(v0);
}

@end
