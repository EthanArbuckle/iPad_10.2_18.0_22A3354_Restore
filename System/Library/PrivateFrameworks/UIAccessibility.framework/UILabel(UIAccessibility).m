@implementation UILabel(UIAccessibility)

- (uint64_t)accessibilityExposeLabelAsValue
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)setAccessibilityExposeLabelAsValue:()UIAccessibility
{
  return __UIAccessibilitySetAssociatedBool();
}

@end
