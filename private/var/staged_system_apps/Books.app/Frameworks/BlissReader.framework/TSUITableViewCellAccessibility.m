@implementation TSUITableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UITableViewCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)editControlWasClicked:(id)a3
{
  TSUITableViewCellAccessibility *v5;
  objc_super v6;

  v5 = self;
  v6.receiver = self;
  v6.super_class = (Class)TSUITableViewCellAccessibility;
  -[TSUITableViewCellAccessibility editControlWasClicked:](&v6, "editControlWasClicked:", a3);
}

@end
