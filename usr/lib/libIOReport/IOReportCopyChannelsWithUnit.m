@implementation IOReportCopyChannelsWithUnit

uint64_t __IOReportCopyChannelsWithUnit_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  return 16 * (IOReportChannelGetUnit(a2) != *(_QWORD *)(a1 + 32));
}

@end
