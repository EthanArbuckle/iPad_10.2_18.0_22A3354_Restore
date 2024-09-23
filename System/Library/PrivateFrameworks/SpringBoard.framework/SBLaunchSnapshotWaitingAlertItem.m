@implementation SBLaunchSnapshotWaitingAlertItem

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)behavesSuperModally
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)allowMenuButtonDismissal
{
  return 0;
}

- (BOOL)allowLockScreenDismissal
{
  return 0;
}

- (BOOL)reappearsAfterLock
{
  return 1;
}

- (BOOL)reappearsAfterUnlock
{
  return 1;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  id v4;

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", CFSTR("Regenerating Default Launch Images..."));
  objc_msgSend(v4, "setMessage:", CFSTR("Your call is important to us. Please wait on the line and a customer service representative will be with you as soon as possible."));

}

@end
