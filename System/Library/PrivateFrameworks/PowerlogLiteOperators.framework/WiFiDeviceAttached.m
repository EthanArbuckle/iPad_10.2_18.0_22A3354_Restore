@implementation WiFiDeviceAttached

void __WiFiDeviceAttached_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(*(id *)(a1 + 32), "findWifiDevice");
  objc_autoreleasePoolPop(v2);
}

@end
