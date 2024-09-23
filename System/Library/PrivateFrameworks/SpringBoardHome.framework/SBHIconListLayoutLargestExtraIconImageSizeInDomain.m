@implementation SBHIconListLayoutLargestExtraIconImageSizeInDomain

void __SBHIconListLayoutLargestExtraIconImageSizeInDomain_block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  uint64_t v5;

  v3 = SBHIconListLayoutExtraIconImageSizeForGridSizeClassAndSpacing(*(void **)(a1 + 32), a2, *(double *)(a1 + 48), *(double *)(a1 + 56), 0.0);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v3 > *(double *)(v5 + 32))
  {
    *(double *)(v5 + 32) = v3;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  if (v4 > *(double *)(v5 + 40))
    *(double *)(v5 + 40) = v4;
}

@end
