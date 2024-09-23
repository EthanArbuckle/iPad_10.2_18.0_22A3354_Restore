@implementation UIHyperInProcessViewAnimator

void __52___UIHyperInProcessViewAnimator__interactionChanged__block_invoke(uint64_t a1)
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

void __64___UIHyperInProcessViewAnimator__interactionEndedMutatingState___block_invoke(uint64_t a1)
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

@end
