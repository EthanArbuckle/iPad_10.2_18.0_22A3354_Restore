@implementation UIMutableApplicationSceneSettings(SBApplicationSceneHandle)

- (BOOL)sb_isEligbleForDeviceOrientationUpdates
{
  return (objc_msgSend(a1, "deactivationReasons") & 8) == 0;
}

@end
