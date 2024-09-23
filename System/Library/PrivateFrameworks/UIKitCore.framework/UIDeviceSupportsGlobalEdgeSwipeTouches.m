@implementation UIDeviceSupportsGlobalEdgeSwipeTouches

uint64_t ___UIDeviceSupportsGlobalEdgeSwipeTouches_block_invoke()
{
  char v0;
  char v1;
  uint64_t result;

  v0 = MGGetBoolAnswer();
  v1 = MGGetBoolAnswer();
  result = _os_feature_enabled_impl();
  byte_1ECD7E310 = (v0 | v1) & result;
  return result;
}

@end
