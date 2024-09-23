@implementation TSCH3DFillAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSCH3DFill");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

@end
