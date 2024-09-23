@implementation UIPageViewController(UIAccessibility)

- (uint64_t)accessibilityScreenChangeOnScroll
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)setAccessibilityScreenChangeOnScroll:()UIAccessibility
{
  return __UIAccessibilitySetAssociatedBool();
}

@end
