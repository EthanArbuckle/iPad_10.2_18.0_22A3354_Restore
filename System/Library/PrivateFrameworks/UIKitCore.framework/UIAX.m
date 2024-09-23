@implementation UIAX

uint64_t ___UIAX_CGPathEnumerateElementsUsingBlock_block_invoke(uint64_t result, int *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v4 = *(unsigned __int8 *)(v2 + 24);
  v3 = v2 + 24;
  if (!v4)
  {
    v6 = result;
    v7 = *(_QWORD *)(result + 32);
    v8 = *a2;
    if (v8 > 3)
      v9 = 0;
    else
      v9 = qword_186677FC0[v8];
    result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t))(v7 + 16))(v7, v8, *((_QWORD *)a2 + 1), v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 24), v3);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 24);
  }
  return result;
}

@end
