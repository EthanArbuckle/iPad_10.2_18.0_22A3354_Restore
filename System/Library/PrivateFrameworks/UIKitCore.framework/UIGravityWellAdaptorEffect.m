@implementation UIGravityWellAdaptorEffect

void __44___UIGravityWellAdaptorEffect_endForHandOff__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "adaptedEffect");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "adaptorInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interaction:didChangeWithContext:", v2, *(_QWORD *)(a1 + 40));

}

void __45___UIGravityWellAdaptorEffect_addCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performAllCompletions");

}

@end
