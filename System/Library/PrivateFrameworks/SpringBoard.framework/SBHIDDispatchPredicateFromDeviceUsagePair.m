@implementation SBHIDDispatchPredicateFromDeviceUsagePair

uint64_t ___SBHIDDispatchPredicateFromDeviceUsagePair_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPrimaryPage:primaryUsage:", *(unsigned int *)(a1 + 32), *(unsigned int *)(a1 + 36));
}

@end
