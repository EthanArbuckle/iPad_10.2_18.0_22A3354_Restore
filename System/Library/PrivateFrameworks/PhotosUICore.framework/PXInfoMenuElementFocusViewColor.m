@implementation PXInfoMenuElementFocusViewColor

void ___PXInfoMenuElementFocusViewColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_44_292299);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_PXInfoMenuElementFocusViewColor_color;
  _PXInfoMenuElementFocusViewColor_color = v0;

}

id ___PXInfoMenuElementFocusViewColor_block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.815686275, 0.819607843, 0.82745098, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
