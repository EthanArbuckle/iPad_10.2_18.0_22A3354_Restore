@implementation THUITextViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UITextView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

@end
