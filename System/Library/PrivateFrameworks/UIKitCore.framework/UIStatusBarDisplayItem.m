@implementation UIStatusBarDisplayItem

uint64_t __48___UIStatusBarDisplayItem_applyStyleAttributes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyStyleAttributes:", *(_QWORD *)(a1 + 40));
}

void __39___UIStatusBarDisplayItem_setFloating___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setFloatingTimer:", 0);
    v3 = objc_msgSend(v4, "floating");
    v2 = v4;
    if (v3)
    {
      objc_msgSend(v4, "_detectedErrorInFloatingState");
      v2 = v4;
    }
  }

}

@end
