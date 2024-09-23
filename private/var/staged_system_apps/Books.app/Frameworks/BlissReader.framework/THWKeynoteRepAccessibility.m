@implementation THWKeynoteRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWKeynoteRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)thaxButtonControlRepIsIgnored:(id)a3
{
  return 1;
}

@end
