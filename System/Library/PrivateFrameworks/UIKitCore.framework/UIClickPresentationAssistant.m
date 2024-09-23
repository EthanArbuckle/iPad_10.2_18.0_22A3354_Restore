@implementation UIClickPresentationAssistant

uint64_t __79___UIClickPresentationAssistant_dismissWithReason_alongsideActions_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __53___UIClickPresentationAssistant__animatePresentation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;

  objc_msgSend(*(id *)(a1 + 32), "sourcePreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bounds");
  objc_msgSend(*(id *)(a1 + 40), "setBounds:");
  v4 = *(void **)(a1 + 48);
  objc_msgSend(v3, "center");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v3, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:fromView:", v9, v6, v8);
  objc_msgSend(*(id *)(a1 + 40), "setCenter:");

  objc_msgSend(*(id *)(a1 + 32), "sourcePreview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "target");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "transform");
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
  }
  v13 = *(void **)(a1 + 40);
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  objc_msgSend(v13, "setTransform:", v14);

  objc_msgSend(*(id *)(a1 + 48), "addSubview:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 56), "prepareTransitionFromView:toView:containerView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

}

uint64_t __53___UIClickPresentationAssistant__animatePresentation__block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "presentationSourcePortalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);

  return objc_msgSend(*(id *)(a1 + 40), "performTransitionFromView:toView:containerView:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __53___UIClickPresentationAssistant__animatePresentation__block_invoke_3(uint64_t a1)
{
  return handleEvent(stateMachineSpec_4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 1, *(_QWORD *)(a1 + 32), (uint64_t *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __53___UIClickPresentationAssistant__animatePresentation__block_invoke_4(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048613, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __53___UIClickPresentationAssistant__animatePresentation__block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "presentationSourcePortalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setPresentationSourcePortalView:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  __int128 v11;
  _OWORD v12[3];

  objc_msgSend(*(id *)(a1 + 32), "sourcePreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bounds");
  objc_msgSend(*(id *)(a1 + 40), "setBounds:");
  v4 = *(void **)(a1 + 48);
  objc_msgSend(v3, "center");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v3, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:fromView:", v9, v6, v8);
  objc_msgSend(*(id *)(a1 + 40), "setCenter:");

  v10 = *(void **)(a1 + 40);
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v12[0] = *MEMORY[0x1E0C9BAA8];
  v12[1] = v11;
  v12[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v10, "setTransform:", v12);
  objc_msgSend(*(id *)(a1 + 48), "addSubview:", *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 56), "prepareTransitionFromView:toView:containerView:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "presentationSourcePortalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);

  return objc_msgSend(*(id *)(a1 + 40), "performTransitionFromView:toView:containerView:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  return handleEvent(stateMachineSpec_4, *(_QWORD *)(v2 + 16), 3, (uint64_t)&v2, (uint64_t *)(v2 + 16));
}

uint64_t __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_5(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048613, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_7(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77___UIClickPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "stashedParentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStashedParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "stashedSuperView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStashedSuperView:", 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77___UIClickPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_2;
  v6[3] = &unk_1E16B47A8;
  v7 = *(id *)(a1 + 40);
  v8 = v2;
  v9 = v3;
  v4 = v3;
  v5 = v2;
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v6);

}

uint64_t __77___UIClickPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  return objc_msgSend(*(id *)(a1 + 40), "addChildViewController:", *(_QWORD *)(a1 + 32));
}

uint64_t __77___UIClickPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __128___UIClickPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __128___UIClickPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  int v5;
  id v6;
  void *v7;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBeingPresented");

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v6, "presentationSourcePortalView");
  }
  else
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "presentedView");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __128___UIClickPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  int v5;
  id v6;
  void *v7;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBeingPresented");

  if (v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "presentedView");
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v6, "presentationSourcePortalView");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __51___UIClickPresentationAssistant_animateTransition___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD *WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v7 = *(void **)(a1 + 32);
  v8 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;
  v9 = v7;

  v10 = (void *)WeakRetained[3];
  WeakRetained[3] = 0;

  objc_msgSend(v6, "transitionDidEnd:", a3);
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a3);

}

@end
