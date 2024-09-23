@implementation _UIInteractiveHighlightEffectWindow

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (BOOL)_isHostingPortalViews
{
  return 1;
}

- (id)_roleHint
{
  return CFSTR("_UIWindowRoleHintPeekAndPop");
}

@end
