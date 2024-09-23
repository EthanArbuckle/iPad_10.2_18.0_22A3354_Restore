@implementation THTSDShapeRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDShapeRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDShapeRepAccessibility, a2);
}

@end
