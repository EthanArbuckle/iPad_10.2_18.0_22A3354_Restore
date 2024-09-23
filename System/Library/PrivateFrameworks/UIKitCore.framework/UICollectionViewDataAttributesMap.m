@implementation UICollectionViewDataAttributesMap

void __59___UICollectionViewDataAttributesMap_indexesOfItemsInRect___block_invoke(uint64_t *a1, uint64_t *a2, __n128 a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = *a2;
  if (*a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(_QWORD *)(v5 + 24);
    if (v6 == v3)
    {
      *(_QWORD *)(v5 + 24) = v3 + 1;
    }
    else
    {
      v7 = *(_QWORD *)(a1[6] + 8);
      v8 = *(_QWORD *)(v7 + 24);
      if (v8 == v3 + 1)
      {
        *(_QWORD *)(v7 + 24) = v3;
      }
      else
      {
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[_UIMutableFastIndexSet addIndexesInRange:](a1[4], v8, v6 - v8, a3);
          v7 = *(_QWORD *)(a1[6] + 8);
        }
        *(_QWORD *)(v7 + 24) = v3;
        *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3 + 1;
      }
    }
  }
}

@end
