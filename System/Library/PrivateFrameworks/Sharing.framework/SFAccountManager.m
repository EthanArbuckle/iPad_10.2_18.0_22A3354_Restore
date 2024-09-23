@implementation SFAccountManager

+ (void)appleAccountSignedIn
{
  id v2;

  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleAccountSignedIn");

}

+ (void)appleAccountSignedOut
{
  id v2;

  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleAccountSignedOut");

}

@end
