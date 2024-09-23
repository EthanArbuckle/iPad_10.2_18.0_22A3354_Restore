@implementation CHUISWidgetHostViewController(SBHWidgetUtilitiesInternal)

- (uint64_t)sbh_isWidgetHostViewController
{
  return 1;
}

- (uint64_t)sbh_underlyingAvocadoHostViewControllers
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1);
}

@end
