@implementation BKUITableViewAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UITableView");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

@end
