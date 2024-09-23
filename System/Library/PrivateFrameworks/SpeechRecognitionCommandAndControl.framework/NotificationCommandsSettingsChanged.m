@implementation NotificationCommandsSettingsChanged

void ___NotificationCommandsSettingsChanged_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x24BEDCDF0];
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cancelPreviousPerformRequestsWithTarget:selector:object:", v1, sel__rebuildCommandRecognizers, 0);

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel__rebuildCommandRecognizers, 0, 1.0);

}

@end
