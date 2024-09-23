@implementation UIColor(TSKAdditions)

+ (uint64_t)tsk_segmentedControlTintColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__UIColor_TSKAdditions__tsk_segmentedControlTintColor__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = a1;
  if (tsk_segmentedControlTintColor_onceToken != -1)
    dispatch_once(&tsk_segmentedControlTintColor_onceToken, block);
  return tsk_segmentedControlTintColor_segmentedControlTintColor;
}

+ (uint64_t)tsk_sheetBackgroundColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__UIColor_TSKAdditions__tsk_sheetBackgroundColor__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = a1;
  if (tsk_sheetBackgroundColor_onceToken != -1)
    dispatch_once(&tsk_sheetBackgroundColor_onceToken, block);
  return tsk_sheetBackgroundColor_sheetBackgroundColor;
}

@end
