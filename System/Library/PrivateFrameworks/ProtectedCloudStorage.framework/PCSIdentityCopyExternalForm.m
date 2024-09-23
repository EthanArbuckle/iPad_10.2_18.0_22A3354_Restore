@implementation PCSIdentityCopyExternalForm

BOOL __PCSIdentityCopyExternalForm_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  const __CFData *v6;
  _BOOL8 result;
  uint64_t v8;
  unint64_t v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 64) + 24 * *(unsigned int *)(*(_QWORD *)(a1[5] + 8) + 24);
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(const __CFData **)(v5 + 24);
  *(_DWORD *)v4 = **(_DWORD **)(v5 + 16);
  result = _PCSFillOctetString((CFIndex *)(v4 + 8), v6);
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(unsigned int *)(v8 + 24);
  if (a1[6] <= v9)
    __PCSIdentityCopyExternalForm_block_invoke_cold_1();
  *(_DWORD *)(v8 + 24) = v9 + 1;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 56) = *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  return result;
}

uint64_t __PCSIdentityCopyExternalForm_block_invoke_2(uint64_t result, const void *a2, uint64_t *cf1)
{
  uint64_t v5;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v5 = result;
    result = CFEqual(cf1, *(CFTypeRef *)(result + 48));
    if (!(_DWORD)result)
    {
      result = CFEqual(*(CFTypeRef *)(cf1[2] + 24), a2);
      if ((_DWORD)result)
      {
        result = AddPCSKey(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 32, cf1[2], *(const void ***)(v5 + 56));
        if ((result & 1) == 0)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 24) = 1;
      }
    }
  }
  return result;
}

void __PCSIdentityCopyExternalForm_block_invoke_cold_1()
{
  __assert_rtn("PCSIdentityCopyExternalForm_block_invoke", "CloudIdentity.m", 2305, "n < count");
}

@end
