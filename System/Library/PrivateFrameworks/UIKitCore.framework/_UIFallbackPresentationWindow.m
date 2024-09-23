@implementation _UIFallbackPresentationWindow

- (BOOL)_canAffectStatusBarAppearance
{
  return 1;
}

- (BOOL)_includeInDefaultImageSnapshot
{
  return 1;
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

@end
