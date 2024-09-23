@implementation TSUDeviceCMYKColorSpace

CGColorSpaceRef __TSUDeviceCMYKColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceCMYK();
  TSUDeviceCMYKColorSpace_sDeviceCMYKColorSpace = (uint64_t)result;
  return result;
}

@end
