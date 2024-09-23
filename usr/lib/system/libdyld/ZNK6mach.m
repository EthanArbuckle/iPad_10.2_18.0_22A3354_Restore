@implementation ZNK6mach

_QWORD *___ZNK6mach_o6Header23zerofillExpansionAmountEv_block_invoke(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = result;
  if (*(_DWORD *)a2 == 1)
  {
    result = (_QWORD *)strcmp((const char *)(a2 + 8), "__TEXT");
    if ((_DWORD)result)
    {
      result = (_QWORD *)strcmp((const char *)(a2 + 8), "__LINKEDIT");
      if ((_DWORD)result)
        return result;
      v6 = *(_QWORD *)(*(_QWORD *)(v5[5] + 8) + 24)
         - (*(_QWORD *)(*(_QWORD *)(v5[4] + 8) + 24)
          + *(unsigned int *)(a2 + 32))
         + *(unsigned int *)(a2 + 24);
      goto LABEL_9;
    }
    *(_QWORD *)(*(_QWORD *)(v5[4] + 8) + 24) = *(unsigned int *)(a2 + 24);
    v7 = *(unsigned int *)(a2 + 32);
  }
  else
  {
    if (*(_DWORD *)a2 != 25)
      return result;
    result = (_QWORD *)strcmp((const char *)(a2 + 8), "__TEXT");
    if ((_DWORD)result)
    {
      result = (_QWORD *)strcmp((const char *)(a2 + 8), "__LINKEDIT");
      if ((_DWORD)result)
        return result;
      v6 = *(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 40) - *(_QWORD *)(*(_QWORD *)(v5[4] + 8) + 24);
LABEL_9:
      *(_QWORD *)(*(_QWORD *)(v5[6] + 8) + 24) = v6;
      *a3 = 1;
      return result;
    }
    *(_QWORD *)(*(_QWORD *)(v5[4] + 8) + 24) = *(_QWORD *)(a2 + 24);
    v7 = *(_QWORD *)(a2 + 40);
  }
  *(_QWORD *)(*(_QWORD *)(v5[5] + 8) + 24) = v7;
  return result;
}

@end
