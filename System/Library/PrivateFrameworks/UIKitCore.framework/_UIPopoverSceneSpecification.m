@implementation _UIPopoverSceneSpecification

- (BOOL)isUIKitManaged
{
  return 1;
}

- (BOOL)isInternal
{
  return 1;
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_self();
}

- (id)uiSceneSessionRole
{
  return CFSTR("UIWindowSceneSessionTypePopover");
}

@end
