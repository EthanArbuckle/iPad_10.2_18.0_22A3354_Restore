@implementation CRLUITextEffectsRemoteViewAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("_UITextEffectsRemoteView");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

@end
