@implementation IOReportCreateSamplesDelta

BOOL __IOReportCreateSamplesDelta_block_invoke(uint64_t a1, const __CFDictionary *a2, const __CFDictionary *a3, const __CFDictionary *a4)
{
  return _compareSamples(a2, a3, a4, *(CFErrorRef **)(a1 + 32)) != 0;
}

@end
