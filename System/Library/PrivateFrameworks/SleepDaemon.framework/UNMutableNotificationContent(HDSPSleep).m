@implementation UNMutableNotificationContent(HDSPSleep)

+ (id)hdsp_notificationContentWithEnvironment:()HDSPSleep
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(v0, "setThreadIdentifier:", *MEMORY[0x24BEA9430]);
  return v0;
}

@end
