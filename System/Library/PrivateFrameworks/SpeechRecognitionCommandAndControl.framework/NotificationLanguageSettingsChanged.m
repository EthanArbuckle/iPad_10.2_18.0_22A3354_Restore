@implementation NotificationLanguageSettingsChanged

void ___NotificationLanguageSettingsChanged_block_invoke()
{
  id v0;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_handleLanguageChange");

}

@end
