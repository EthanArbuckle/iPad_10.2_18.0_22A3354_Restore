@implementation IOReportCopyChannelsForDrivers

uint64_t __IOReportCopyChannelsForDrivers_block_invoke(uint64_t a1, uint64_t a2)
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  uint64_t v5;

  v3 = _IOReportCopyChannelsForDriver(a2, 0, 0, *(CFErrorRef **)(a1 + 32));
  if (!v3)
    return 3758097084;
  v4 = v3;
  v5 = IOReportMergeChannels(*(const __CFDictionary **)(a1 + 40), v3, *(CFErrorRef **)(a1 + 32));
  CFRelease(v4);
  return v5;
}

@end
