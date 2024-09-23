@implementation UIPopoverLegacyChromeView

uint64_t __45___UIPopoverLegacyChromeView_didMoveToWindow__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_loadNecessaryViews");
  result = objc_msgSend(*(id *)(a1 + 32), "isPinned");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 546) = result;
  return result;
}

@end
