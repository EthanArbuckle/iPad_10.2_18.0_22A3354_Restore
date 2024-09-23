@implementation AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation

uint64_t ___AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("FullKeyboardAccessUsesSimulatedKeyboardForAutomation"), (CFStringRef)kAXSAccessibilityPreferenceDomain, 0);
  _AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation_UsesSimulatedKeyboard = result;
  return result;
}

@end
