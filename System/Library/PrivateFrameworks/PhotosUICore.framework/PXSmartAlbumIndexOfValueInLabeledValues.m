@implementation PXSmartAlbumIndexOfValueInLabeledValues

uint64_t __PXSmartAlbumIndexOfValueInLabeledValues_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == *(void **)(a1 + 32))
    v5 = 1;
  else
    v5 = objc_msgSend(v3, "isEqual:");

  return v5;
}

@end
