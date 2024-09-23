@implementation SKUIGraphicsDeviceHasASTCSupport

uint64_t __SKUIGraphicsDeviceHasASTCSupport_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  SKUIGraphicsDeviceHasASTCSupport_supportsASTC = result;
  return result;
}

@end
