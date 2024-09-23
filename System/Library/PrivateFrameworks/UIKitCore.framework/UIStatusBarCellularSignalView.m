@implementation UIStatusBarCellularSignalView

uint64_t __58___UIStatusBarCellularSignalView__updateCycleAnimationNow__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "signalMode");
  if (result == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCycleAnimation:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "start");
  }
  return result;
}

uint64_t __50___UIStatusBarCellularSignalView__updateFromMode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "signalMode");
  if (result != 1)
    return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return result;
}

@end
