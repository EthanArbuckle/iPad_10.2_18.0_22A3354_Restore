@implementation SFPersonCollectionViewMaximumSizeCategory

void ___SFPersonCollectionViewMaximumSizeCategory_block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  id *v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = (id *)MEMORY[0x24BEBE078];
  if (v2 >= v1)
    v4 = v1;
  else
    v4 = v2;
  if (v4 > 320.0)
    v3 = (id *)MEMORY[0x24BEBE070];
  objc_storeStrong((id *)&_SFPersonCollectionViewMaximumSizeCategory_maxCategory, *v3);
}

@end
