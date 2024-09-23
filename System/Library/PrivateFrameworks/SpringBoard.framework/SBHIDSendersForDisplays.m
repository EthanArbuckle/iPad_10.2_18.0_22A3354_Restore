@implementation SBHIDSendersForDisplays

uint64_t ___SBHIDSendersForDisplays_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAssociatedDisplay:", *(_QWORD *)(a1 + 32));
}

@end
