@implementation WFToggleContextualActions

uint64_t __WFToggleContextualActions_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

@end
