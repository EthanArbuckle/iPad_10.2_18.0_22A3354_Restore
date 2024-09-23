@implementation PUIDynamicRotationIsActive

uint64_t __PUIDynamicRotationIsActive_block_invoke()
{
  char v0;
  uint64_t result;

  v0 = PF_IS_PAD_DEVICE();
  result = _os_feature_enabled_impl();
  PUIDynamicRotationIsActive_dynamicRotationIsActive = v0 & result;
  return result;
}

@end
