@implementation PLDeviceSupportsASTC

uint64_t __PLDeviceSupportsASTC_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  PLDeviceSupportsASTC_s_hasSupport = result;
  return result;
}

@end
