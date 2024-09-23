@implementation UIViewController(SBHWidgetUtilitiesInternal)

- (uint64_t)sbh_isMultiplexingViewController
{
  return 0;
}

- (uint64_t)sbh_isWidgetHostViewController
{
  return 0;
}

- (uint64_t)sbh_isWidgetStackViewController
{
  return 0;
}

- (uint64_t)sbh_isCustomIconImageViewController
{
  return 0;
}

- (uint64_t)sbh_underlyingAvocadoHostViewControllers
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

@end
