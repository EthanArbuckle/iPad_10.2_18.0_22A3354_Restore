@implementation UICollectionViewLayout(AccessibilityBridging)

- (uint64_t)setTs_sortItemsLogicallyForAccessibility:()AccessibilityBridging
{
  return objc_msgSend(a1, "ts_axSetBoolValue:forKey:", a3, CFSTR("kTSUICollectionViewLayoutAccessibilityLogicalSortKey"));
}

- (uint64_t)ts_sortItemsLogicallyForAccessibility
{
  return objc_msgSend(a1, "ts_axBoolValueForKey:", CFSTR("kTSUICollectionViewLayoutAccessibilityLogicalSortKey"));
}

- (id)_accessibilitySortCollectionViewLogically
{
  objc_super v3;

  if (objc_msgSend(a1, "ts_axHasValueForKey:", CFSTR("kTSUICollectionViewLayoutAccessibilityLogicalSortKey")))return (id)objc_msgSend(a1, "ts_sortItemsLogicallyForAccessibility");
  v3.receiver = a1;
  v3.super_class = (Class)&off_1EEFA0208;
  return objc_msgSendSuper2(&v3, sel__accessibilitySortCollectionViewLogically);
}

@end
