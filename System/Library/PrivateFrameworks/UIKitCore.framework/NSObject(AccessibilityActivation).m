@implementation NSObject(AccessibilityActivation)

- (void)_keyboardActivate
{
  const void *v2;
  uint64_t v3;
  dispatch_time_t v4;
  _QWORD block[5];

  v2 = (const void *)objc_msgSend(a1, "_keyboardActivateEventDown:", 1);
  v3 = objc_msgSend(a1, "_keyboardActivateEventDown:", 0);
  objc_msgSend((id)UIApp, "_enqueueHIDEvent:", v2);
  CFRelease(v2);
  v4 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__NSObject_AccessibilityActivation___keyboardActivate__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

- (uint64_t)_keyboardActivateEventDown:()AccessibilityActivation
{
  uint64_t DigitizerEvent;
  const void *DigitizerFingerEventWithQuality;

  objc_msgSend(a1, "accessibilityActivationPoint");
  mach_absolute_time();
  DigitizerEvent = IOHIDEventCreateDigitizerEvent();
  DigitizerFingerEventWithQuality = (const void *)IOHIDEventCreateDigitizerFingerEventWithQuality();
  IOHIDEventAppendEvent();
  objc_msgSend(a1, "_accessibilityGetContextID", 0, 0);
  BKSHIDEventSetDigitizerInfo();
  CFRelease(DigitizerFingerEventWithQuality);
  return DigitizerEvent;
}

- (uint64_t)_accessibilityGetContextID
{
  UIWindow *v2;

  if ((objc_opt_respondsToSelector() & 1) == 0 || (v2 = (UIWindow *)objc_msgSend(a1, "_accessibilityWindow")) == 0)
    v2 = -[UIScreen _preferredFocusedWindow](+[UIScreen mainScreen](UIScreen, "mainScreen"), "_preferredFocusedWindow");
  return -[UIWindow _contextId](v2, "_contextId");
}

@end
