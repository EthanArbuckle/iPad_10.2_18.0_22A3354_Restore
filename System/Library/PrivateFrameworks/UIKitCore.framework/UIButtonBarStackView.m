@implementation UIButtonBarStackView

void __42___UIButtonBarStackView_updateConstraints__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 448));
  objc_msgSend(WeakRetained, "_layoutBar");

}

@end
