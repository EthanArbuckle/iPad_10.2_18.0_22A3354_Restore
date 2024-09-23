@implementation BKExpandedWebContentViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKExpandedWebContentViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (id)contentView
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKExpandedWebContentViewControllerAccessibility;
  v2 = -[BKExpandedWebContentViewControllerAccessibility contentView](&v5, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "imaxSetIdentification:", CFSTR("PreviewContentView"));
  return v3;
}

@end
