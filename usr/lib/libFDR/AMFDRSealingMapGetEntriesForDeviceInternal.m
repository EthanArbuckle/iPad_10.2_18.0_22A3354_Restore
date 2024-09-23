@implementation AMFDRSealingMapGetEntriesForDeviceInternal

uint64_t __AMFDRSealingMapGetEntriesForDeviceInternal_block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = (const void *)copyProductType(*(_QWORD *)(a1 + 32));
  if (!v1
    || (AMFDRSealingMapGetEntriesForDeviceInternal_deviceSealingMap = (uint64_t)_AMFDRSealingMapGetEntries(v1)) == 0
    && (!AMFDRSealingMapCallMGCopyAnswerInternal(CFSTR("r5pA2qLgR86BQKwgMjPWzg"), 0, 0)
     || (AMFDRSealingMapGetEntriesForDeviceInternal_deviceSealingMap = (uint64_t)_AMFDRSealingMapGetEntries(CFSTR("iRefDefault"))) != 0))
  {
    AMSupportLogInternal();
  }
  AMSupportSafeRelease();
  return AMSupportSafeRelease();
}

@end
