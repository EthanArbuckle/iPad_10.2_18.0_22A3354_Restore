@implementation UICollectionPreferredSizes

void __90___UICollectionPreferredSizes_preferredSizesApplyingFrameOffset_supplementaryBaseOffsets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = objc_msgSend(*(id *)(a1 + 32), "rangeForElementKind:", a2);
  if (v7)
    v8 = v6 + v7;
  else
    v8 = 0;
  v9 = -[_UICollectionPreferredSizes initWithSizes:indexes:supplementarySizesDict:frameOffset:supplementaryBaseOffsets:]([_UICollectionPreferredSizes alloc], *(void **)(a3 + 8), *(void **)(a3 + 16), 0, v8, 0);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, a2);

}

void __59___UICollectionPreferredSizes_copyByDirtyingPreferredSizes__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v5;
  id *v6;

  if (a3)
  {
    v5 = -[_UICollectionPreferredSize initWithOriginalSize:fittingSize:layoutSize:additionalData:]([_UICollectionPreferredSize alloc], *(void **)(a3 + 40), *(void **)(a3 + 56), *(double *)(a3 + 8), *(double *)(a3 + 16), *(double *)(a3 + 24), *(double *)(a3 + 32));
    *((_BYTE *)v5 + 48) = 1;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, a2);

}

void __59___UICollectionPreferredSizes_copyByDirtyingPreferredSizes__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  v5 = (id)-[_UICollectionPreferredSizes copyByDirtyingPreferredSizes](a3);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, a2);

}

void __46___UICollectionPreferredSizes_largestItemSize__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  float64x2_t v4;

  -[_UICollectionPreferredSizes objectAtIndexedSubscript:](*(_QWORD *)(a1 + 32), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = *(float64x2_t *)(v3 + 24);
  else
    v4 = 0uLL;
  *(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = vmaxnmq_f64(v4, *(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)+ 8)+ 32));

}

@end
