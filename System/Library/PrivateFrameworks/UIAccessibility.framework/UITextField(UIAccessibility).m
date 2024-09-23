@implementation UITextField(UIAccessibility)

- (uint64_t)accessibilityValueChangesAreReplacements
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)setAccessibilityValueChangesAreReplacements:()UIAccessibility
{
  return __UIAccessibilitySetAssociatedBool();
}

@end
