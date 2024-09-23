@implementation UIAXAutomationIgnoreLogging

uint64_t ___UIAXAutomationIgnoreLogging_block_invoke()
{
  const __CFString *v0;
  uint64_t result;

  v0 = (const __CFString *)_AXSAccessibilityPreferenceDomain();
  result = CFPreferencesGetAppBooleanValue(CFSTR("AXAutomationIgnoreLogging"), v0, 0);
  _UIAXAutomationIgnoreLogging_IgnoreLogging = (_DWORD)result != 0;
  return result;
}

@end
