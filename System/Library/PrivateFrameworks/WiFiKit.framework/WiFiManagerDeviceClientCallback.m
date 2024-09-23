@implementation WiFiManagerDeviceClientCallback

uint64_t ___WiFiManagerDeviceClientCallback_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWithDeviceAttachment:", *(_QWORD *)(a1 + 40));
}

@end
