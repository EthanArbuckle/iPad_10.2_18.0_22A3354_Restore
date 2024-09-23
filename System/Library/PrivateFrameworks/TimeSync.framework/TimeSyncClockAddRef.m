@implementation TimeSyncClockAddRef

uint64_t __TimeSyncClockAddRef_block_invoke(uint64_t a1)
{
  return objc_msgSend((id)_timeSyncClockRefs, "addPointer:", *(_QWORD *)(a1 + 32));
}

@end
