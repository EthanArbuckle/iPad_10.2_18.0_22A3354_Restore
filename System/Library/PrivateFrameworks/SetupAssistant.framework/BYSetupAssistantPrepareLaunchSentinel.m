@implementation BYSetupAssistantPrepareLaunchSentinel

void __BYSetupAssistantPrepareLaunchSentinel_block_invoke()
{
  id v0;

  +[BYAppleIDAccountsManager sharedManager](BYAppleIDAccountsManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "runPostRestoreRenewCredentialsIfNeeded");

}

@end
