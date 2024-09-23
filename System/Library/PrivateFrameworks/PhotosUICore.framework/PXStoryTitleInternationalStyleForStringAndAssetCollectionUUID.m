@implementation PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID

BOOL __PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID_block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  if (a2 == 2)
    return 1;
  if (a2)
    return 0;
  if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
    return 1;
  return *(_QWORD *)(a1 + 32) <= vcvtd_n_u64_f64(a3, 0x40uLL);
}

@end
