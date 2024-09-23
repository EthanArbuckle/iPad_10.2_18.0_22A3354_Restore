@implementation PXDisplayAssetIndexSubfetchResult

_QWORD *__52___PXDisplayAssetIndexSubfetchResult_indexOfObject___block_invoke(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  if (result[6] == a2)
  {
    *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
    *a3 = 1;
  }
  ++*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
  return result;
}

uint64_t __55___PXDisplayAssetIndexSubfetchResult_objectsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) + 8 * a2));
}

uint64_t __67___PXDisplayAssetIndexSubfetchResult_initWithFetchResult_indexSet___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v3 = *(_QWORD **)(v2 + 24);
  *v3 = a2;
  *(_QWORD *)(v2 + 24) = v3 + 1;
  return result;
}

@end
