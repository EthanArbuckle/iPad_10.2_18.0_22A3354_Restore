@implementation TSDMediaStyleAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDMediaStyle");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSSStyleAccessibility, a2);
}

@end
