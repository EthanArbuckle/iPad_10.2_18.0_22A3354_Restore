@implementation VKMDeviceCMYKColorSpace

CGColorSpaceRef __VKMDeviceCMYKColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceCMYK();
  VKMDeviceCMYKColorSpace_sDeviceCMYKColorSpace = (uint64_t)result;
  return result;
}

@end
