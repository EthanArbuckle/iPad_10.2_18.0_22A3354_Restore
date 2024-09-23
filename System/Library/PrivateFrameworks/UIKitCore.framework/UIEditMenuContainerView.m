@implementation UIEditMenuContainerView

void __65___UIEditMenuContainerView__dismissMenuPresentationForSizeChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 432));
  objc_msgSend(WeakRetained, "hideMenuWithReason:", 2);

}

@end
