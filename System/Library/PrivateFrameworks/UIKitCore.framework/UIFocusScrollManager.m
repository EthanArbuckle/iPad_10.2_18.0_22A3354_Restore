@implementation UIFocusScrollManager

BOOL __105___UIFocusScrollManager_animateOffsetOfScrollableContainersInParentEnvironmentContainer_toShowFocusItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "scrollableContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scrollableContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

void __66___UIFocusScrollManager__scrollWithScrollRequest_onlyIfNecessary___block_invoke(id *a1, int a2)
{
  id v4;
  id v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v4 = objc_loadWeakRetained(a1 + 6);
  v5 = objc_loadWeakRetained(a1 + 7);
  v6 = v5;
  if (a2 && v5)
  {
    objc_msgSend(v4, "_scrollViewDidEndDeceleratingForDelegate");
    objc_msgSend(a1[4], "reloadFocusItemInfo");
    objc_msgSend(WeakRetained, "_ensureFocusItemIsOnscreenForScrollRequest:", a1[4]);
  }

}

@end
