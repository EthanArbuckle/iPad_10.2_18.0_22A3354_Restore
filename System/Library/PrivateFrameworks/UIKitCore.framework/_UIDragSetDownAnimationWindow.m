@implementation _UIDragSetDownAnimationWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_isHostingPortalViews
{
  return 1;
}

- (id)_roleHint
{
  return CFSTR("_UIWindowRoleHintDragAnimation");
}

@end
