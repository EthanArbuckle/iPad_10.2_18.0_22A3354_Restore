@implementation PXInfoMenuElementSelectedBackgroundColor

void ___PXInfoMenuElementSelectedBackgroundColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_50);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_PXInfoMenuElementSelectedBackgroundColor_color;
  _PXInfoMenuElementSelectedBackgroundColor_color = v0;

}

id ___PXInfoMenuElementSelectedBackgroundColor_block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.815686275, 0.819607843, 0.82745098, 0.5);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.37);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
