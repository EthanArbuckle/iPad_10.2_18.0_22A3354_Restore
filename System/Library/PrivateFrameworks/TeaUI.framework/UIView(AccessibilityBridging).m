@implementation UIView(AccessibilityBridging)

- (uint64_t)ts_accessibilityInterfaceStyleIntent
{
  return 0;
}

- (id)_accessibilityIsSpeakThisElement
{
  objc_super v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(a1, "ts_accessibilityIsSpeakThisElement");
  v3.receiver = a1;
  v3.super_class = (Class)UIView_0;
  return objc_msgSendSuper2(&v3, sel__accessibilityIsSpeakThisElement);
}

@end
