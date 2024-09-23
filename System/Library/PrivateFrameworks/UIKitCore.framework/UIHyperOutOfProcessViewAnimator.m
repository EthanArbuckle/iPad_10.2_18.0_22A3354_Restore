@implementation UIHyperOutOfProcessViewAnimator

void __55___UIHyperOutOfProcessViewAnimator__interactionChanged__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_interactor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_interactor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hyperInteractorApplyPresentationPoint:", v3);

}

double __67___UIHyperOutOfProcessViewAnimator__interactionEndedMutatingState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40) + *(double *)(a2 + 8 * v2);
  *(double *)(a2 + 8 * v2) = result;
  return result;
}

void __67___UIHyperOutOfProcessViewAnimator__interactionEndedMutatingState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_interactor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a2 + 8 * *(_QWORD *)(a1 + 40)) = *(_QWORD *)(objc_msgSend(v4, "_constrainedPoint")
                                                           + 8 * *(_QWORD *)(a1 + 40));

}

void __67___UIHyperOutOfProcessViewAnimator__interactionEndedMutatingState___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_interactor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_interactor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hyperInteractorApplyPresentationPoint:", v3);

}

uint64_t __79___UIHyperOutOfProcessViewAnimator__animateWithParameters_velocity_animations___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(*(id *)(a1 + 32), "_preferredFrameRateRange");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = objc_msgSend(*(id *)(a1 + 32), "_updateReason");
  LODWORD(v9) = v3;
  LODWORD(v10) = v5;
  LODWORD(v11) = v7;
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v8, *(_QWORD *)(a1 + 40), v9, v10, v11);
}

void __79___UIHyperOutOfProcessViewAnimator__animateWithParameters_velocity_animations___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2)
  {
    objc_msgSend(WeakRetained, "_propertyAnimators");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v2);

  }
}

@end
