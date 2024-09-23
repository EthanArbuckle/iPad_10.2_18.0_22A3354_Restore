@implementation UIView

void __41__UIView_SBUIAdditions__sbui_drawEagerly__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayIfNeeded");

  objc_setAssociatedObject(*(id *)(a1 + 32), "hasDrawn", 0, 0);
}

@end
