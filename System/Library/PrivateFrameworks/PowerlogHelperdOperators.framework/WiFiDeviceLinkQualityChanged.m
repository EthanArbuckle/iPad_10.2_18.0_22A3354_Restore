@implementation WiFiDeviceLinkQualityChanged

void __WiFiDeviceLinkQualityChanged_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1DF0A47AC]();
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardRSSI:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

@end
