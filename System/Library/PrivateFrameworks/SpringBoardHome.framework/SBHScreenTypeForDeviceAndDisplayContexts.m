@implementation SBHScreenTypeForDeviceAndDisplayContexts

uint64_t __SBHScreenTypeForDeviceAndDisplayContexts_block_invoke()
{
  return 0;
}

uint64_t __SBHScreenTypeForDeviceAndDisplayContexts_block_invoke_2()
{
  return 1;
}

uint64_t __SBHScreenTypeForDeviceAndDisplayContexts_block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deviceInfoFloatValueForKey:", *MEMORY[0x1E0DC5CC0]);
  return BSFloatEqualToFloat();
}

@end
