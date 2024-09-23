@implementation PXStoryIdentifierFromClipLayouts

id ___PXStoryIdentifierFromClipLayouts_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "clip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v3, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
