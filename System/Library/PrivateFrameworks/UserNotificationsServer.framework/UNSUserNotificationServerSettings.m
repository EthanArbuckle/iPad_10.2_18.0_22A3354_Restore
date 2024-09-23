@implementation UNSUserNotificationServerSettings

+ (id)settingsControllerModule
{
  return (id)objc_msgSend(MEMORY[0x24BE7B338], "moduleWithTitle:contents:", CFSTR("UserNotifications"), MEMORY[0x24BDBD1A8]);
}

@end
