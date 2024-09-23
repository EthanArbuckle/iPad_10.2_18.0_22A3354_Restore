@implementation PXInfoMenuElementFocusColor

void ___PXInfoMenuElementFocusColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_48_292306);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_PXInfoMenuElementFocusColor_color;
  _PXInfoMenuElementFocusColor_color = v0;

}

id ___PXInfoMenuElementFocusColor_block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "userInterfaceStyle");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
