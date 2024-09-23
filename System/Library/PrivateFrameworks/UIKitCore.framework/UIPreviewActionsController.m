@implementation UIPreviewActionsController

void __88___UIPreviewActionsController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(WeakRetained, "_presentSubactionsForActionGroup:", v4);
  else
    objc_msgSend(WeakRetained, "_dismissWithAction:", v4);

}

uint64_t __61___UIPreviewActionsController__dismissForSelectedSwipeAction__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;

  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCenter:", v2, v3);

  return objc_msgSend(*(id *)(a1 + 40), "setCenter:", *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void __61___UIPreviewActionsController__dismissForSelectedSwipeAction__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = dispatch_time(0, 150000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61___UIPreviewActionsController__dismissForSelectedSwipeAction__block_invoke_3;
  v4[3] = &unk_1E16B1B50;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, MEMORY[0x1E0C80D38], v4);

}

void __61___UIPreviewActionsController__dismissForSelectedSwipeAction__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_hideChromeAndSetAffordanceHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "quickAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewActionsController:didCompleteWithSelectedAction:", v2, v3);

}

uint64_t __50___UIPreviewActionsController__dismissWithAction___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCenter:", v2, v3);

  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "previewActionsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", v5, v6);

  return objc_msgSend(*(id *)(a1 + 32), "_setAffordanceAlpha:withDuration:hideOnCompletion:", 1, 0.0, 0.1);
}

void __50___UIPreviewActionsController__dismissWithAction___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_hideChromeAndSetAffordanceHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = v2;
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v2, "previewActionsController:didCompleteWithSelectedAction:", v3);
  else
    objc_msgSend(v2, "didDismissPreviewActionsController:", v3);

}

void __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  id v3;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCenter:", v1, v2);

}

uint64_t __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setPreviewActionsView:", *(_QWORD *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_5;
  v3[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 40);
  v5 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

void __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "_configurePlatterDynamicsController");
  objc_msgSend(*(id *)(a1 + 40), "platterDynamicsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_beginInYLockedStatePresented");

  objc_msgSend(*(id *)(a1 + 40), "previewActionsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

}

void __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_6(uint64_t a1)
{
  double v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v2 = *(double *)(a1 + 56);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_7;
  v3[3] = &unk_1E16B2E18;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v3, 0, v2, 0.0);

}

uint64_t __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_7(_QWORD *a1)
{
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", a1[4], 0.0, 1.0);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", a1[5], 0.0, 0.5);
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", a1[6], 0.5, 0.5);
}

void __81___UIPreviewActionsController__setAffordanceAlpha_withDuration_hideOnCompletion___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "affordanceView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

void __81___UIPreviewActionsController__setAffordanceAlpha_withDuration_hideOnCompletion___block_invoke_2(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "affordanceView");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setHidden:", 1);

  }
}

@end
