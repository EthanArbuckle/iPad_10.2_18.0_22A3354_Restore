@implementation SASymbolOwnerIsContiguous

unint64_t __SASymbolOwnerIsContiguous_block_invoke(_QWORD *a1)
{
  unint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  result = CSRegionGetRange();
  v4 = *(_QWORD *)(a1[5] + 8);
  if (*(_QWORD *)(v4 + 24) < result + v3)
    *(_QWORD *)(v4 + 24) = result + v3;
  v5 = *(_QWORD *)(a1[6] + 8);
  if (*(_QWORD *)(v5 + 24) > result)
    *(_QWORD *)(v5 + 24) = result;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += v3;
  return result;
}

@end
