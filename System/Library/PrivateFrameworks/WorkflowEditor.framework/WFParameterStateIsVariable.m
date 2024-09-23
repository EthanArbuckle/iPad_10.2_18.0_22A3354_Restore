@implementation WFParameterStateIsVariable

uint64_t __WFParameterStateIsVariable_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t result;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    result = WFParameterStateIsVariable(a2);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  else
  {
    result = 0;
  }
  *(_BYTE *)(v6 + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

@end
