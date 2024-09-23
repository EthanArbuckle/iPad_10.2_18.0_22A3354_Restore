@implementation ISSoftwareMapXPC

uint64_t ____ISSoftwareMapXPC_block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x24BEB20D8]);
  result = objc_msgSend(v0, "initWithServiceName:", *MEMORY[0x24BEB2C28]);
  __ISSoftwareMapXPC_sConnection = result;
  return result;
}

@end
