@implementation AEMarginNotesControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("AEMarginNotesController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

@end
