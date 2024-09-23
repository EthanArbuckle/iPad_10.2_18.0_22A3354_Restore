@implementation TSDKeyboardMovementManipulatorAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDKeyboardMovementManipulator");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

@end
