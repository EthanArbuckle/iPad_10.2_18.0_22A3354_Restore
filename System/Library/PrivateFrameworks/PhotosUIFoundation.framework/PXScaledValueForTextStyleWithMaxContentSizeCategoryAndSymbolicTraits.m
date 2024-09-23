@implementation PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits

id __PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  _PXFontWithTextStyleSymbolicTraits(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v2, "_scaledValueForValue:", *(double *)(a1 + 48));
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_cache;
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_cache = (uint64_t)v0;

}

@end
