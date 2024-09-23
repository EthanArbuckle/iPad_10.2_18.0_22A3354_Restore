@implementation FBSDisplayIdentity(NonInteractiveResolverSupport)

- (uint64_t)_sb_nonInteractiveAvailableWithSwitcher:()NonInteractiveResolverSupport applicationController:authenticationState:
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = objc_msgSend(a1, "type");
  if (v8 == 5)
  {
    objc_msgSend(v7, "musicApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v9 = v10;
    objc_msgSend(v10, "processState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication = objc_msgSend(v11, "isRunning");

LABEL_10:
    goto LABEL_12;
  }
  if (v8 == 4)
  {
    objc_msgSend(v7, "iPodOutApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v8 != 1)
  {
    HasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication = 0;
    goto LABEL_12;
  }
  if ((_DWORD)HasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication)
  {
    if (!objc_msgSend(a1, "isRestrictedAirPlayDisplay"))
    {
      HasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication = 1;
      goto LABEL_12;
    }
    objc_msgSend(v7, "applicationWithPid:", objc_msgSend(a1, "pid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication = SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication(v9);
    goto LABEL_10;
  }
LABEL_12:

  return HasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication;
}

- (BOOL)_sb_requiresUserAuthenticationFirst
{
  return objc_msgSend(a1, "type") == 1;
}

- (BOOL)_sb_requiresAppRunningFirst
{
  return (objc_msgSend(a1, "type") & 0xFFFFFFFFFFFFFFFELL) == 4;
}

@end
