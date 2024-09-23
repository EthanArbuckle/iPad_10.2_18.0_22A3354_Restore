@implementation UIView

uint64_t __61__UIView_PhotoLibraryAdditions__pl_setHidden_delay_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __61__UIView_PhotoLibraryAdditions__pl_setHidden_delay_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  double v3;

  result = objc_msgSend(*(id *)(a1 + 32), "alpha");
  if (v3 == *(double *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(unsigned __int8 *)(a1 + 48));
  return result;
}

@end
