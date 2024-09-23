@implementation UIColor(AccessibilityBridging)

- (uint64_t)ttriAccessibilityColorDescription
{
  return objc_msgSend(a1, "_accessibilityColorDescriptionWithOptions:", 1);
}

@end
