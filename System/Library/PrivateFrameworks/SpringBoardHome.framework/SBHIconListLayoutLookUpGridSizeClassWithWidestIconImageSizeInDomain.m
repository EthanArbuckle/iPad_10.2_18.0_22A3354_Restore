@implementation SBHIconListLayoutLookUpGridSizeClassWithWidestIconImageSizeInDomain

void __SBHIconListLayoutLookUpGridSizeClassWithWidestIconImageSizeInDomain_block_invoke(uint64_t a1, void *a2)
{
  double v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v4 = SBHIconListLayoutIconImageInfoForGridSizeClass(*(void **)(a1 + 32), v6);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v4 > *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }

}

@end
