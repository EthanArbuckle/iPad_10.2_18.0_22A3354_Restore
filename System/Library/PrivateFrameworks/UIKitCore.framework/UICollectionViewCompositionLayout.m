@implementation UICollectionViewCompositionLayout

uint64_t __54___UICollectionViewCompositionLayout_removeSublayout___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(result + 32) == a3)
    return objc_msgSend(*(id *)(result + 40), "addObject:", a2);
  return result;
}

@end
