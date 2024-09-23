@implementation THAEMarginNotesControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("AEMarginNotesController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

@end
