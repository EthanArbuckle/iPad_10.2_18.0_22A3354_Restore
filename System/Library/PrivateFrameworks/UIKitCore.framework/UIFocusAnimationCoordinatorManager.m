@implementation UIFocusAnimationCoordinatorManager

void __59___UIFocusAnimationCoordinatorManager_activeCoordinatorMap__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1032;
  _MergedGlobals_1032 = v0;

}

uint64_t __72___UIFocusAnimationCoordinatorManager_didUpdateFocusInContext_fromItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "activeFocusAnimation");
  objc_msgSend(*(id *)(a1 + 32), "_prepareForFocusAnimation:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained
    && (v4 = WeakRetained,
        v5 = *(void **)(a1 + 40),
        v6 = objc_loadWeakRetained((id *)(a1 + 48)),
        LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6),
        v6,
        v4,
        (_DWORD)v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "_animateFocusAnimation:", 1);
    v7 = *(void **)(a1 + 40);
    v8 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v7, "removeObject:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_cancelFocusAnimation:", 1);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_prepareForFocusAnimation:", v2);
}

@end
