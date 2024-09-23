@implementation NotificationOverlayOptionsSettingsChanged

void ___NotificationOverlayOptionsSettingsChanged_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cancelAnyTransientOverlay");

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hideAnyNonInteractiveOverlay");

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatePresentationForActiveOverlay");

}

@end
