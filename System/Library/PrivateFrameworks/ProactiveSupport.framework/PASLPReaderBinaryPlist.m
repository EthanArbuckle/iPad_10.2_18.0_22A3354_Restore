@implementation PASLPReaderBinaryPlist

uint64_t __112___PASLPReaderBinaryPlist__decodeOffset_decodedObject_ifEqualToReferenceObject_validationDepth_unlazyCopyCache___block_invoke(uint64_t a1, const void *a2, uint64_t a3, size_t __n, _BYTE *a5)
{
  uint64_t result;

  result = memcmp((const void *)(*(_QWORD *)(a1 + 40) + a3), a2, __n);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a5 = 1;
  }
  return result;
}

@end
