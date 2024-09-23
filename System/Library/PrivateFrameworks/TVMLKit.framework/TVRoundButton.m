@implementation TVRoundButton

void __59___TVRoundButton__updateFloaingViewFocusState_coordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "floatingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setControlState:withAnimationCoordinator:", 8 * *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

@end
