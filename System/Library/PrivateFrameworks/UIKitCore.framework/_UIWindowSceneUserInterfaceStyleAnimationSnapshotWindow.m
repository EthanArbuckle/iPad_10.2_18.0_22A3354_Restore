@implementation _UIWindowSceneUserInterfaceStyleAnimationSnapshotWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_ignoresHitTest
{
  return 1;
}

- (id)_roleHint
{
  return CFSTR("_UIWindowRoleHintSnapshotting");
}

@end
