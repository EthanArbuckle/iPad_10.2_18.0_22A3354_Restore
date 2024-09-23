@implementation PXInfoMenuElementNormalColor

void ___PXInfoMenuElementNormalColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_46_292302);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_PXInfoMenuElementNormalColor_color;
  _PXInfoMenuElementNormalColor_color = v0;

}

id ___PXInfoMenuElementNormalColor_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  double v3;

  v2 = objc_msgSend(a2, "userInterfaceStyle");
  v3 = 0.0;
  if (v2 == 2)
    v3 = 1.0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v3, 0.5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
