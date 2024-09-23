@implementation UIStatusBarRegionAxesLayout

void __50___UIStatusBarRegionAxesLayout__updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "layoutItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set_ui_usesManualLayout:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_ui_addSubLayoutItem:", v3);

}

@end
