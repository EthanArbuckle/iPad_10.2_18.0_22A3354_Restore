@implementation UIPreviewTransitionController

uint64_t __59___UIPreviewTransitionController__animateRevealTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutForPresentationPhase:", 1);
}

uint64_t __59___UIPreviewTransitionController__animateRevealTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_completeAnimationWithPresentationPhase:finished:", 1, a2);
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
}

uint64_t __60___UIPreviewTransitionController__animatePreviewTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutForPresentationPhase:", 2);
}

uint64_t __60___UIPreviewTransitionController__animatePreviewTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeAnimationWithPresentationPhase:finished:", 2, a2);
}

uint64_t __60___UIPreviewTransitionController__animateDismissTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutForPresentationPhase:", 5);
}

uint64_t __60___UIPreviewTransitionController__animateDismissTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_completeAnimationWithPresentationPhase:finished:", 5, a2);
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
}

uint64_t __59___UIPreviewTransitionController__animateCommitTransition___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  _OWORD v15[8];

  objc_msgSend(*(id *)(a1 + 32), "_computeAndApplyScrollContentInsetDeltaForViewController:", *(_QWORD *)(a1 + 40));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(id *)(a1 + 40);
    v4 = objc_msgSend(v2, "_viewControllerUnderlapsStatusBar");
    if (v3)
    {
      v5 = 0x8000000000;
      if (!v4)
        v5 = 0;
      v3[46] = v3[46] & 0xFFFFFF7FFFFFFFFFLL | v5;
    }
    objc_msgSend(v3, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_computeAndApplyScrollContentInsetDeltaForViewController:", v6);

  }
  objc_msgSend(*(id *)(a1 + 48), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v15[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v15[5] = v8;
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v15[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v15[7] = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v15[0] = *MEMORY[0x1E0CD2610];
  v15[1] = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v15[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v15[3] = v11;
  objc_msgSend(v7, "setSublayerTransform:", v15);

  objc_msgSend(*(id *)(a1 + 48), "setShouldLayoutForCommitPhase:", 1);
  objc_msgSend(*(id *)(a1 + 48), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 56), "setEffect:", 0);
  v12 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 72), "bounds");
  objc_msgSend(v12, "setFrame:");
  v13 = *(void **)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 72), "bounds");
  return objc_msgSend(v13, "setFrame:");
}

uint64_t __59___UIPreviewTransitionController__animateCommitTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 64), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 72), "addSubview:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 80), "setFrame:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
  objc_msgSend(*(id *)(a1 + 88), "addSubview:", *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 104), "addSubview:", *(_QWORD *)(a1 + 112));
  objc_msgSend(*(id *)(a1 + 120), "_completeAnimationWithPresentationPhase:finished:", 4, a2);
  return objc_msgSend(*(id *)(a1 + 128), "completeTransition:", 1);
}

void __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_2(id *a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_3;
  v3[3] = &unk_1E16B51E8;
  v2 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = a1[4];
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, v3);

}

uint64_t __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_3(_QWORD *a1)
{
  char v2;
  void *v3;
  uint64_t v4;

  v2 = objc_opt_respondsToSelector();
  v3 = (void *)a1[4];
  v4 = a1[5];
  if ((v2 & 1) != 0)
    return objc_msgSend(v3, "previewInteractionController:performCommitToViewController:", v4, a1[6]);
  else
    return objc_msgSend(v3, "previewInteractionController:performCommitForPreviewViewController:committedViewController:", v4, a1[7], a1[6]);
}

void __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_41(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;

  v4 = a2;
  v5 = v4;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v7 = v4;
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v7;
    if ((isKindOfClass & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      v5 = v7;
    }
  }

}

id __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_2_46(uint64_t a1)
{
  id v2;
  uint64_t v3;

  v2 = *(id *)(a1 + 32);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "previewInteractionController:committedViewControllerForPreviewViewController:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v3;
  }
  return v2;
}

uint64_t __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_3_48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "previewInteractionController:performCommitForPreviewViewController:committedViewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48));
}

@end
