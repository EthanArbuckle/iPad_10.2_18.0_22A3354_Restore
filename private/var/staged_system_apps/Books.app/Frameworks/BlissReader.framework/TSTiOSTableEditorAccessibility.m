@implementation TSTiOSTableEditorAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTiOSTableEditor");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSTTableEditorAccessibility, a2);
}

@end
