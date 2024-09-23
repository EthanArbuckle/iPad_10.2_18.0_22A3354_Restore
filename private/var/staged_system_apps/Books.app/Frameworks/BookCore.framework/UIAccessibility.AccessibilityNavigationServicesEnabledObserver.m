@implementation UIAccessibility.AccessibilityNavigationServicesEnabledObserver

- (void)update
{
  char IsFKAEnabledWithKeyboardAttached;
  char v4;

  swift_retain(self);
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _AXSCommandAndControlEnabled())
  {
    IsFKAEnabledWithKeyboardAttached = 1;
  }
  else
  {
    IsFKAEnabledWithKeyboardAttached = IMAccessibilityIsFKAEnabledWithKeyboardAttached();
  }
  v4 = IsFKAEnabledWithKeyboardAttached;
  CurrentValueSubject.value.setter(&v4);
  swift_release(self);
}

@end
