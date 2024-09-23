@implementation DBSReverseZoomEnabled

uint64_t __DBSReverseZoomEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  DBSReverseZoomEnabled__reverseZoomEnabled = result;
  return result;
}

@end
