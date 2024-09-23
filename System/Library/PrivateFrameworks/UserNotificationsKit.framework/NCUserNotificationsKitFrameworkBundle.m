@implementation NCUserNotificationsKitFrameworkBundle

void __NCUserNotificationsKitFrameworkBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.UserNotificationsKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NCUserNotificationsKitFrameworkBundle___bundle;
  NCUserNotificationsKitFrameworkBundle___bundle = v0;

}

@end
