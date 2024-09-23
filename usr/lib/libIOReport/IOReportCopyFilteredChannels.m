@implementation IOReportCopyFilteredChannels

uint64_t __IOReportCopyFilteredChannels_block_invoke(uint64_t a1, uint64_t a2)
{
  __CFDictionary *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  CFTypeRef cf;

  cf = 0;
  v4 = _IOReportCopyChannelsForDriver(a2, *(_DWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), (CFErrorRef *)&cf);
  if (v4)
  {
    v5 = (const __CFString *)v4;
    v6 = IOReportMergeChannels(*(const __CFDictionary **)(a1 + 40), v4, *(CFErrorRef **)(a1 + 48));
  }
  else
  {
    v5 = IOReportCopyDriverName(a2);
    iorErrLog(*(_DWORD *)(a1 + 56), v5, (CFErrorRef)cf);
    v6 = 0;
    v7 = 0;
    if (!v5)
      goto LABEL_5;
  }
  CFRelease(v5);
  v7 = v6;
LABEL_5:
  if (cf)
    CFRelease(cf);
  return v7;
}

@end
