@implementation SBAppExitedWorkspaceTransaction

- (void)_begin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAppExitedWorkspaceTransaction;
  -[SBAppExitedWorkspaceTransaction _begin](&v3, sel__begin);
  -[SBToAppsWorkspaceTransaction activateApplications](self, "activateApplications");
}

- (void)_didComplete
{
  void *v3;
  objc_super v4;

  +[SBSceneLayoutWhitePointAdaptationController sharedInstance](SBSceneLayoutWhitePointAdaptationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateWhitePointAdaptationStrength");

  objc_msgSend((id)SBApp, "updateNativeOrientationAnimated:logMessage:", 1, CFSTR("App exited, interface orientation may need to be updated."));
  v4.receiver = self;
  v4.super_class = (Class)SBAppExitedWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction _didComplete](&v4, sel__didComplete);
}

@end
