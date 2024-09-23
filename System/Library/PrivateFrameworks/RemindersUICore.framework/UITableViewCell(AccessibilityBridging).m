@implementation UITableViewCell(AccessibilityBridging)

- (uint64_t)_accessibilityIsSpeakThisElement
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "ttriAccessibilityIsSpeakThisElement");
  else
    return 0;
}

@end
