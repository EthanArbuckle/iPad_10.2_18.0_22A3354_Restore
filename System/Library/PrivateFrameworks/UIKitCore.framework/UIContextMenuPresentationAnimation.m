@implementation UIContextMenuPresentationAnimation

id __72___UIContextMenuPresentationAnimation_initWithUIController_asDismissal___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (a3)
  {
    objc_msgSend(WeakRetained, "stashedDismissalPreview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_platterView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
    {
      v12 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v7, "stashedDismissalPreview");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(WeakRetained, "_dismissalPreviewForSecondaryItemPreview:", v5);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
LABEL_7:

  return v12;
}

void __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_targetedPreviewForDismissalAnimation");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 != v4)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "_isDismissingToDrag") & 1) == 0)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "isSingleItemMenu"))
      {
        objc_msgSend(*(id *)(a1 + 40), "expandedLayout");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "type");

        if (v6 != 3)
          objc_msgSend(*(id *)(a1 + 40), "_prepareReparentingAnimationWithDismissalTarget:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      }
      objc_msgSend(*(id *)(a1 + 40), "_anchorTransitionViewToTargetedPreview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    }
    objc_msgSend(*(id *)(a1 + 48), "setCollapsedPreview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  objc_msgSend(*(id *)(a1 + 48), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
}

uint64_t __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "scrollToFirstSignificantAction");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_4(uint64_t a1, double a2)
{
  double v2;
  id WeakRetained;
  _QWORD v5[5];
  char v6;

  v2 = 0.1;
  if (*(_BYTE *)(a1 + 40))
    v2 = 0.5;
  if (v2 < a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setAccessoryAnimationBlock:", 0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_5;
    v5[3] = &unk_1E16B1B78;
    v5[4] = WeakRetained;
    v6 = *(_BYTE *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_accessoryViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setVisible:animated:", *(unsigned __int8 *)(a1 + 40), 1);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __56___UIContextMenuPresentationAnimation_performTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_actuallyPerformTransition");
}

uint64_t __79___UIContextMenuPresentationAnimation__performReduceMotionAppearanceTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

id __82___UIContextMenuPresentationAnimation__performReduceMotionDisappearanceTransition__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_targetedPreviewForDismissalAnimation");
}

uint64_t __73___UIContextMenuPresentationAnimation__prepareOverallAnimationCompletion__block_invoke(id *a1)
{
  objc_msgSend(a1[4], "removeFromSuperview");
  objc_msgSend(a1[5], "removeFromSuperview");
  objc_msgSend(a1[6], "removeFromSuperview");
  return objc_msgSend(a1[7], "removeFromSuperview");
}

void __80___UIContextMenuPresentationAnimation__prepareAnimatablePropertyBasedAnimations__block_invoke_2(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  void *v4;
  void (**v5)(double);
  void *v6;
  void (**v7)(double);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "animationProgress");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentationValue");
  v3 = v2;

  objc_msgSend(WeakRetained, "reparentingAnimationBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(WeakRetained, "reparentingAnimationBlock");
    v5 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v5[2](v3);

  }
  objc_msgSend(WeakRetained, "accessoryAnimationBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "accessoryAnimationBlock");
    v7 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v7[2](v3);

  }
}

void __80___UIContextMenuPresentationAnimation__prepareAnimatablePropertyBasedAnimations__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_shouldAnimateBackgroundEffects"))
    objc_msgSend(WeakRetained, "_setBackgroundVisible:", objc_msgSend(WeakRetained, "isDismissTransition") ^ 1);

}

void __80___UIContextMenuPresentationAnimation__prepareAnimatablePropertyBasedAnimations__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "uiController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "backgroundViewAnimationProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValue");
  v4 = v3;

  objc_msgSend(WeakRetained, "_presentation_applyBackgroundEffectWithProgress:", v4);
}

void __87___UIContextMenuPresentationAnimation__prepareReparentingAnimationWithDismissalTarget___block_invoke(id *a1, double a2)
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "reparentingPortalView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 >= 0.5)
  {
    v5 = fmax(fmin(a2 + -0.5 + a2 + -0.5, 1.0), 0.0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - v5 + v5 * 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setPresentationValue:forKey:", v6, CFSTR("opacity"));
    objc_msgSend(a1[4], "_setPresentationValue:forKey:", v6, CFSTR("filters.opacityPair.inputAmount"));

  }
  objc_msgSend(a1[5], "overridePositionTrackingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1[6], "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "center");
    objc_msgSend(v8, "convertPoint:toView:", v7);
    v10 = v9;
    v12 = v11;

    objc_msgSend(a1[6], "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertPoint:toView:", v13, v10, v12);
    v15 = v14;
    v17 = v16;

    v18 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v15, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setPresentationValue:forKey:", v19, CFSTR("position"));

  }
}

@end
