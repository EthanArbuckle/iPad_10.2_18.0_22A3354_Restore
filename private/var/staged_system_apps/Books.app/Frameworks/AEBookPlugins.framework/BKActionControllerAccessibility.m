@implementation BKActionControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKActionController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (id)barButtonItem
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKActionControllerAccessibility;
  v2 = -[BKActionControllerAccessibility barButtonItem](&v7, "barButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = AEAXLocString(CFSTR("action.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  return v3;
}

@end
