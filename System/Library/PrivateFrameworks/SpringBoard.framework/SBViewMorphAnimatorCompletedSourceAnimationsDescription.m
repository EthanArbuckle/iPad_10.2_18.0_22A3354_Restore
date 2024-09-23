@implementation SBViewMorphAnimatorCompletedSourceAnimationsDescription

uint64_t __SBViewMorphAnimatorCompletedSourceAnimationsDescription_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = a2 - 1;
  if ((unint64_t)(a2 - 1) <= 7 && ((0x8Bu >> v2) & 1) != 0)
    return objc_msgSend(*(id *)(result + 32), "addObject:", off_1E8EAFE90[v2]);
  return result;
}

@end
