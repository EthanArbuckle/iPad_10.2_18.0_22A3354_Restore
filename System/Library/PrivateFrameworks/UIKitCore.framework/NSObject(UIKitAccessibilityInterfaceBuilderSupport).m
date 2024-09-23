@implementation NSObject(UIKitAccessibilityInterfaceBuilderSupport)

- (void)setAccessibilityIdentifier:()UIKitAccessibilityInterfaceBuilderSupport
{
  objc_setAssociatedObject(a1, &AXIdentifierIdentifier, a3, (void *)3);
}

- (uint64_t)defaultAccessibilityTraits
{
  return 0;
}

- (uint64_t)isAccessibilityElementByDefault
{
  return 0;
}

- (uint64_t)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

@end
