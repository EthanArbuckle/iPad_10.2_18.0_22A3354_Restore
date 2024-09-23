@implementation IOReportCopyChannelsWithID

uint64_t __IOReportCopyChannelsWithID_block_invoke(uint64_t a1, uint64_t a2)
{
  __CFArray *LegendChannel;
  __CFArray *v5;
  __CFDictionary *DriverChannel;
  uint64_t v7;

  LegendChannel = _createLegendChannel(*(_QWORD *)(a1 + 32), 0, 0, *(CFErrorRef **)(a1 + 40));
  if (!LegendChannel)
    return 3758097084;
  v5 = LegendChannel;
  DriverChannel = _createDriverChannel(a2, LegendChannel, 0, 0, 0, 0, *(CFErrorRef **)(a1 + 40));
  CFRelease(v5);
  if (!DriverChannel)
    return 3758097084;
  v7 = _addChannel(*(const __CFDictionary **)(a1 + 48), DriverChannel, 0, *(CFErrorRef **)(a1 + 40));
  CFRelease(DriverChannel);
  return v7;
}

@end
