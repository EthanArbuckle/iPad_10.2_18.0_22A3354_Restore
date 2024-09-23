@implementation PXPeopleCandidateWidgetContainerView

uint64_t __55___PXPeopleCandidateWidgetContainerView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setFrame:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layoutIfNeeded");
}

@end
