@implementation CRLUIAccessibilityPickerComponentAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UIAccessibilityPickerComponent");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

- (UIPickerView)crlaxPickerView
{
  return (UIPickerView *)-[CRLUIAccessibilityPickerComponentAccessibility picker](self, "picker");
}

@end
