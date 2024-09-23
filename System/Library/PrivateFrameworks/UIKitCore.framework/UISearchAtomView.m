@implementation UISearchAtomView

uint64_t __41___UISearchAtomView_setEnabled_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateColors");
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
}

@end
