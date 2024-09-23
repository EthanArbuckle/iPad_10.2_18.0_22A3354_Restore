@implementation PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl

uint64_t __91___PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl__updateVariationSliderTrackView__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))++/ (double)(unint64_t)(*(_QWORD *)(a1 + 40) - 1));
}

uint64_t __91___PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl__updateVariationSliderTrackView__block_invoke_2(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

@end
