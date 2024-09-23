@implementation NSArray(VGInternal)

+ (id)vg_arrayWithNumbersFromVectorf:()VGInternal
{
  void *v5;
  double v6;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", *(unsigned int *)(a3 + 16));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned int *)(a3 + 16);
  if ((_DWORD)v7)
  {
    v8 = *(_DWORD **)a3;
    v9 = 4 * v7;
    do
    {
      LODWORD(v6) = *v8;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v10);

      ++v8;
      v9 -= 4;
    }
    while (v9);
  }
  objc_msgSend(a1, "arrayWithArray:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
