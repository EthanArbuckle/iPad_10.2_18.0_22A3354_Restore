@implementation UIAccessibilityCustomRotor(PrivateRotor)

- (uint64_t)setLinkCount:()PrivateRotor
{
  return objc_msgSend(a1, "_accessibilitySetIntegerValue:forKey:", a3, CFSTR("linkCount"));
}

- (uint64_t)linkCount
{
  return objc_msgSend(a1, "_accessibilityIntegerValueForKey:", CFSTR("linkCount"));
}

- (uint64_t)setVisibleInTouchRotor:()PrivateRotor
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("visibleInTouchRotor"));
}

- (uint64_t)visibleInTouchRotor
{
  return objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("visibleInTouchRotor"));
}

@end
