@implementation UIHyperInProcessPointAnimator

void __53___UIHyperInProcessPointAnimator_initWithDimensions___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  int IsBoundaryCrossedFromPointToPoint;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_interactor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(WeakRetained, "_animatableProperty");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "_presentationValue");

    if (objc_msgSend(WeakRetained, "_generatesFeedbackWhenBoundaryIsCrossed"))
    {
      if ((objc_msgSend(WeakRetained, "_regionChangedDiscontinuouslyOnChange") & 1) != 0
        || (objc_msgSend(v1, "_region"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            IsBoundaryCrossedFromPointToPoint = _UIHyperregionIsBoundaryCrossedFromPointToPoint(v4, objc_msgSend(v1, "_presentationPoint"), v3), v4, IsBoundaryCrossedFromPointToPoint))
      {
        objc_msgSend(WeakRetained, "_feedbackGenerator");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "selectionChanged");

        objc_msgSend(WeakRetained, "_setRegionChangedDiscontinuouslyOnChange:", 0);
      }
    }
    objc_msgSend(v1, "_copyOverridePresentationPoint:", v3);
    objc_msgSend(v1, "_delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_hyperInteractorApplyPresentationPoint:", v1);

  }
}

void __53___UIHyperInProcessPointAnimator__interactionChanged__block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v2 = MEMORY[0x1E0C80A78](*(_QWORD *)(a1 + 32)).n128_u64[0];
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v5, "_interactor", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_closestPoint");
  cblas_dcopy_NEWLAPACK();

  objc_msgSend(*(id *)(a1 + 32), "_interactor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_interactor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_hyperInteractorApplyPresentationPoint:", v9);

  objc_msgSend(*(id *)(a1 + 32), "_interactor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setRegionChangedDiscontinuouslyOnChange:", memcmp(v4, (const void *)objc_msgSend(v10, "_closestPoint"), 8 * *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)) != 0);

}

uint64_t __53___UIHyperInProcessPointAnimator__interactionChanged__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAnimatablePropertyValuesToConstrainedPoint");
}

void __65___UIHyperInProcessPointAnimator__interactionEndedMutatingState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_interactor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_interactor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hyperInteractorApplyPresentationPoint:", v3);

}

uint64_t __65___UIHyperInProcessPointAnimator__interactionEndedMutatingState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAnimatablePropertyValuesToConstrainedPoint");
}

void __65___UIHyperInProcessPointAnimator__animateWithPrelude_animations___block_invoke(uint64_t a1, int a2, char a3)
{
  id v3;

  if (a2)
  {
    if ((a3 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_interactor");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_setOverridingPresentationPoint:", 0);

    }
  }
}

@end
