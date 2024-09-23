@implementation UIPlatterMenuDynamicsController

void __86___UIPlatterMenuDynamicsController__animateToPlatterDismissedWithDuration_completion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCenter:", v2, v3);

  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "menuView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", v5, v6);

}

uint64_t __86___UIPlatterMenuDynamicsController__animateToPlatterDismissedWithDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __109___UIPlatterMenuDynamicsController_beginTransitionWithAnimatorUsingBehaviors_observedItems_stateIfCompleted___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addBehaviorIfNotPresent:", a2);
}

void __109___UIPlatterMenuDynamicsController_beginTransitionWithAnimatorUsingBehaviors_observedItems_stateIfCompleted___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stopObservingBehavior");
  objc_msgSend(WeakRetained, "performActionsAndEnterState:velocity:underDirectManipulation:", *(_QWORD *)(a1 + 40), objc_msgSend(WeakRetained, "isCurrentlyUnderDirectManipulation"), 0.0, 0.0);
  if (objc_msgSend(WeakRetained, "isCurrentlyUnderDirectManipulation"))
  {
    objc_msgSend(WeakRetained, "platterView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "center");
    v4 = v3;
    v6 = v5;
    objc_msgSend(WeakRetained, "gestureAttachmentBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnchorPoint:", v4, v6);

    objc_msgSend(WeakRetained, "gestureAttachmentBehavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "addBehaviorIfNotPresent:", v8);

  }
}

void __67___UIPlatterMenuDynamicsController_resetAnimatorToDefaultBehaviors__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isDefaultAnimatorBehavior:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __67___UIPlatterMenuDynamicsController_resetAnimatorToDefaultBehaviors__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "animator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeBehavior:", v3);

}

@end
