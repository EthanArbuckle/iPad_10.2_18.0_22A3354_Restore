@implementation PCSFDECopyUnwrappedDataWithSet

_QWORD *__PCSFDECopyUnwrappedDataWithSet_block_invoke(_QWORD *result, int a2, _QWORD *cf)
{
  uint64_t v3;
  _DWORD *v4;
  _QWORD *v5;

  if (!*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24))
  {
    v3 = cf[2];
    if (v3)
    {
      v4 = *(_DWORD **)(v3 + 16);
      if (v4)
      {
        if (*v4 == 6)
        {
          v5 = result;
          result = CFRetain(cf);
          *(_QWORD *)(*(_QWORD *)(v5[4] + 8) + 24) = result;
        }
      }
    }
  }
  return result;
}

@end
