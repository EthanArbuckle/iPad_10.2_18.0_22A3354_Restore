@implementation UIPencilInteractionSqueezeIsEnabled

uint64_t ___UIPencilInteractionSqueezeIsEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  _MergedGlobals_1202 = result;
  return result;
}

@end
