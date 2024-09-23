@implementation NSMutableArray

uint64_t __75__NSMutableArray_SiriUIFoundationAdditions__sruif_isValidIndexSetToInsert___block_invoke(uint64_t result, unint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  if (v4 >= a2)
  {
    *(_QWORD *)(v3 + 24) = v4 + 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

@end
