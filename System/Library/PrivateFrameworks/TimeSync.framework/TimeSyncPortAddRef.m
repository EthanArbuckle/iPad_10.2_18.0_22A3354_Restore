@implementation TimeSyncPortAddRef

uint64_t __TimeSyncPortAddRef_block_invoke(uint64_t a1)
{
  return objc_msgSend((id)_timeSyncPortRefs, "addPointer:", *(_QWORD *)(a1 + 32));
}

@end
