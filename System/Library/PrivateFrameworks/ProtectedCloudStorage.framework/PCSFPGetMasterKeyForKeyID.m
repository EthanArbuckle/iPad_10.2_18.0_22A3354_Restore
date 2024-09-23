@implementation PCSFPGetMasterKeyForKeyID

CFIndex __PCSFPGetMasterKeyForKeyID_block_invoke(CFIndex result, CFDataRef theData, uint64_t a3)
{
  CFIndex v5;
  const __CFData *v6;
  CFRange v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v5 = result;
    v6 = *(const __CFData **)(result + 40);
    v7.length = CFDataGetLength(theData);
    v7.location = 0;
    result = CFDataFind(theData, v6, v7, 2uLL).location;
    if (!result)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 24) = a3;
  }
  return result;
}

@end
