@implementation UIFullscreenPresentationController

uint64_t __120___UIFullscreenPresentationController__adjustOrientationIfNecessaryInWindow_forViewController_preservingViewController___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __120___UIFullscreenPresentationController__adjustOrientationIfNecessaryInWindow_forViewController_preservingViewController___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40)
                                                                                            + 8)
                                                                                + 24);
  return result;
}

void __118___UIFullscreenPresentationController__placeCounterRotationViewWithView_inWindow_fromOrientation_toOrientation_force___block_invoke(uint64_t a1)
{
  -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 1, 0.0);
  -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 48), 1, *(unsigned __int8 *)(a1 + 56), 0.0);
}

void __69___UIFullscreenPresentationController__transitionDidEnd_isDismissal___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_removeCounterRotationIfApplied");
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v5, "presentedViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_setFreezeLayoutForOrientationChangeOnDismissal:", 0);

    }
    v4 = (void *)v5[53];
    v5[53] = 0;

    WeakRetained = v5;
  }

}

@end
