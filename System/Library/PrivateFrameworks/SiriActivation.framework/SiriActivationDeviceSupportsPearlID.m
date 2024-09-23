@implementation SiriActivationDeviceSupportsPearlID

uint64_t ___SiriActivationDeviceSupportsPearlID_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _SiriActivationDeviceSupportsPearlID_deviceSupportsPearlID = result;
  return result;
}

@end
