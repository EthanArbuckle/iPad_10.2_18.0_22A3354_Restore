@implementation WiFiClientScanCacheCallback

uint64_t __WiFiClientScanCacheCallback_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "updateEventBackwardUserScanDuration:", *(_QWORD *)(a1 + 32));
}

@end
