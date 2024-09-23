@implementation UICollectionViewLayoutSwipeViewManipulator

void __97___UICollectionViewLayoutSwipeViewManipulator_moveSwipedView_atIndexPath_withSwipeInfo_animator___block_invoke(uint64_t a1)
{
  _UIPerformImmediateCollectionViewLayoutAndVisibleCellsUpdate(*(void **)(a1 + 32));
  _UIUpdateMaskViewFrameForSwipedCellAtIndexPath(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

@end
