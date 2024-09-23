@implementation BK__AXQSMenuHelper

+ (id)imaxTargetClassName
{
  return CFSTR("AXQSMenuHelper");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)restoreMenu
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BK__AXQSMenuHelper imaxValueForKey:](self, "imaxValueForKey:", CFSTR("thirdPartyMenuItems")));

  if (v3)
  {
    v4.receiver = self;
    v4.super_class = (Class)BK__AXQSMenuHelper;
    -[BK__AXQSMenuHelper restoreMenu](&v4, "restoreMenu");
  }
}

@end
