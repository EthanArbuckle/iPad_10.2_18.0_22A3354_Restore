@implementation UIActionSheetCompactPresentationController

void __98___UIActionSheetCompactPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 354) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_layoutViews");
  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateContentOverlayInsetsFromParentIfNecessary");

}

uint64_t __78___UIActionSheetCompactPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setShouldAdoptPresentedAppearance:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_applyVisualAffordancesToViews");
  return objc_msgSend(*(id *)(a1 + 32), "_layoutViews");
}

uint64_t __78___UIActionSheetCompactPresentationController_presentationTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75___UIActionSheetCompactPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_applyVisualAffordancesToViews");
  return objc_msgSend(*(id *)(a1 + 32), "_layoutViews");
}

void __101___UIActionSheetCompactPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "animationCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_transitionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewWillTransitionToSize:withTransitionCoordinator:", v7, *(double *)(a1 + 40), *(double *)(a1 + 48));

}

void __101___UIActionSheetCompactPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layoutViews");

}

void __101___UIActionSheetCompactPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAnimationCoordinator:", 0);

}

uint64_t __55___UIActionSheetCompactPresentationController__dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "actionSheetCompactPresentationControllerDidDismiss:", *(_QWORD *)(a1 + 40));
}

@end
