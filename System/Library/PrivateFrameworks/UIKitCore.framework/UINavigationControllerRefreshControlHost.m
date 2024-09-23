@implementation UINavigationControllerRefreshControlHost

void __59___UINavigationControllerRefreshControlHost_stopAnimations__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "endRefreshing");

}

uint64_t __87___UINavigationControllerRefreshControlHost_refreshControl_didChangeToState_fromState___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87___UINavigationControllerRefreshControlHost_refreshControl_didChangeToState_fromState___block_invoke_2;
  v3[3] = &unk_1E16B1B28;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "performWhileAnimatingAutomaticContentOffsetAdjustments:", v3);
}

void __87___UINavigationControllerRefreshControlHost_refreshControl_didChangeToState_fromState___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutBelowIfNeeded");

}

uint64_t __67___UINavigationControllerRefreshControlHost__notifyLayoutDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "navigationControllerRefreshControlHostDidUpdateLayout:", *(_QWORD *)(a1 + 40));
}

@end
