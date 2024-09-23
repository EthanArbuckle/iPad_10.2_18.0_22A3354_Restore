@implementation UITraitTokenSetIsSubsetOfSet

unint64_t ___UITraitTokenSetIsSubsetOfSet_block_invoke(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  unint64_t result;

  result = _UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 40), a2);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

@end
