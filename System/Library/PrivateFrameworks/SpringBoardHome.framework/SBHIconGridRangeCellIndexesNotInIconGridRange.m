@implementation SBHIconGridRangeCellIndexesNotInIconGridRange

uint64_t __SBHIconGridRangeCellIndexesNotInIconGridRange_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = SBHIconGridRangeContainsCellIndex(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(_DWORD *)(a1 + 56));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
  return result;
}

@end
