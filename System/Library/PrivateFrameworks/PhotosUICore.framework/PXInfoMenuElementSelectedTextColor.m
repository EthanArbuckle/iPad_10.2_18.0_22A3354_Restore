@implementation PXInfoMenuElementSelectedTextColor

void ___PXInfoMenuElementSelectedTextColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_52_292304);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_PXInfoMenuElementSelectedTextColor_color;
  _PXInfoMenuElementSelectedTextColor_color = v0;

}

id ___PXInfoMenuElementSelectedTextColor_block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  double v3;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.9;
    v3 = 0.0;
  }
  else
  {
    v2 = 0.86;
    v3 = 1.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v3, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
