@implementation _UIBackgroundHitTestWindow

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (id)_roleHint
{
  return CFSTR("_UIWindowRoleHintHitTesting");
}

@end
