@implementation IOReportCreateSamplesRaw

uint64_t __IOReportCreateSamplesRaw_block_invoke(uint64_t a1, const __CFDictionary *a2, const __CFDictionary *a3)
{
  return _visitSample(a2, a3, 1, (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(CFErrorRef **)(a1 + 40));
}

@end
