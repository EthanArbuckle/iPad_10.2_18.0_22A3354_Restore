@implementation SBFakeiTunesRestoreTestRecipe

- (id)title
{
  return CFSTR("Enter/Exit Fake iTunes Restore State");
}

- (void)handleVolumeIncrease
{
  id v2;

  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginRestoring");

}

- (void)handleVolumeDecrease
{
  id v2;

  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelRestoring");

}

@end
