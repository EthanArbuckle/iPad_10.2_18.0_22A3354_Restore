@implementation IOReportGetChannelCount

uint64_t __IOReportGetChannelCount_block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 0;
}

@end
