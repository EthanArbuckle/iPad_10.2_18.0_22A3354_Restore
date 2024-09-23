@implementation SBHIconListLayoutLookUpGridSizeClassWithLargestIconImageSizeInDomain

void __SBHIconListLayoutLookUpGridSizeClassWithLargestIconImageSizeInDomain_block_invoke(uint64_t a1, void *a2)
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v4 = SBHIconListLayoutIconImageInfoForGridSizeClass(*(void **)(a1 + 32), v8);
  v6 = v4 * v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v6 > *(double *)(v7 + 24))
  {
    *(double *)(v7 + 24) = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }

}

@end
