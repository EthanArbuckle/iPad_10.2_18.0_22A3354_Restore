@implementation THWControlContainerRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWControlContainerRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDContainerRepAccessibility, a2);
}

@end
