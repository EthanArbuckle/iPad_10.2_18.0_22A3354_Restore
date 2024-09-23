@implementation UIAccessibilityElement(AccessibilityBridging)

- (id)ttriAccessibilityHasTextOperations
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)UIAccessibilityElement_0;
  return objc_msgSendSuper2(&v2, sel__accessibilityHasTextOperations);
}

- (id)ttriAccessibilityTextOperations
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)UIAccessibilityElement_0;
  objc_msgSendSuper2(&v2, sel__accessibilityTextOperations);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ttriAccessibilityEditOperationAction:()AccessibilityBridging
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)UIAccessibilityElement_0;
  return objc_msgSendSuper2(&v2, sel_accessibilityEditOperationAction_);
}

@end
