@implementation DBSChamoisEnabled

uint64_t __DBSChamoisEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  DBSChamoisEnabled__isChamoisEnabled = result;
  return result;
}

@end
