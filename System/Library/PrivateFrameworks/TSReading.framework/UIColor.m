@implementation UIColor

uint64_t __54__UIColor_TSKAdditions__tsk_segmentedControlTintColor__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithWhite:alpha:", 0.23137255, 1.0);
  tsk_segmentedControlTintColor_segmentedControlTintColor = result;
  return result;
}

uint64_t __49__UIColor_TSKAdditions__tsk_sheetBackgroundColor__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithRed:green:blue:alpha:", 0.905882359, 0.913725495, 0.933333337, 1.0);
  tsk_sheetBackgroundColor_sheetBackgroundColor = result;
  return result;
}

@end
