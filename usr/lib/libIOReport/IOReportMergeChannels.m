@implementation IOReportMergeChannels

BOOL __IOReportMergeChannels_block_invoke(uint64_t a1, const void *a2)
{
  return _addChannel(*(const __CFDictionary **)(a1 + 32), a2, *(_DWORD *)(a1 + 48), *(CFErrorRef **)(a1 + 40)) != 0;
}

@end
