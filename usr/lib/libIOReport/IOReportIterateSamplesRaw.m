@implementation IOReportIterateSamplesRaw

uint64_t __IOReportIterateSamplesRaw_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  const __CFDictionary *MutableCopy;
  uint64_t v5;

  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  v5 = _visitSample(theDict, MutableCopy, 0, (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(CFErrorRef **)(a1 + 48));
  if (!(_DWORD)v5)
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CFRelease(MutableCopy);
  return v5;
}

@end
