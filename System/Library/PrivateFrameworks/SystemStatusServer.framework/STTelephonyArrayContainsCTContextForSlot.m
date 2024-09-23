@implementation STTelephonyArrayContainsCTContextForSlot

BOOL __STTelephonyArrayContainsCTContextForSlot_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "slotID") == *(_QWORD *)(a1 + 32);
}

@end
