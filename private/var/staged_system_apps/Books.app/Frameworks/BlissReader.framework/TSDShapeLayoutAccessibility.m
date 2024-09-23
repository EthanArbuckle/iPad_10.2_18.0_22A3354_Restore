@implementation TSDShapeLayoutAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDShapeLayout");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDLayoutAccessibility, a2);
}

@end
