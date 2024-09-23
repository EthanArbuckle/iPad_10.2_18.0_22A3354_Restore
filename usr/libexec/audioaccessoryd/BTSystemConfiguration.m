@implementation BTSystemConfiguration

+ (BOOL)isBuddyComplete
{
  char HasCompletedInitialRun;
  NSObject *v3;

  if (BYSetupAssistantNeedsToRun(a1, a2))
    HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun();
  else
    HasCompletedInitialRun = 1;
  byte_100212610 = HasCompletedInitialRun;
  v3 = qword_100218BD8;
  if (os_log_type_enabled((os_log_t)qword_100218BD8, OS_LOG_TYPE_DEBUG))
    sub_10016E6FC(v3);
  return byte_100212610;
}

+ (BOOL)isFirstUnlocked
{
  NSObject *v2;

  byte_100212611 = MKBDeviceUnlockedSinceBoot(a1, a2) != 0;
  v2 = qword_100218BD8;
  if (os_log_type_enabled((os_log_t)qword_100218BD8, OS_LOG_TYPE_DEBUG))
    sub_10016E77C(v2);
  return byte_100212611;
}

+ (id)addBuddyCompleteObserver:(id)a3
{
  return +[BTStateWatcher monitorBuddyStateWithAction:](BTStateWatcher, "monitorBuddyStateWithAction:", a3);
}

+ (id)addFirstUnlockObserver:(id)a3
{
  return +[BTStateWatcher monitorFirstUnlockWithAction:](BTStateWatcher, "monitorFirstUnlockWithAction:", a3);
}

@end
