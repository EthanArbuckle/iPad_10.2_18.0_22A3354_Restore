@implementation UIAnimationCoordinator

uint64_t __34___UIAnimationCoordinator_animate__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

uint64_t __47___UIAnimationCoordinator_animateInteractively__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

uint64_t __45___UIAnimationCoordinator_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_postInteractiveCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_postInteractiveCompletionHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_setPostInteractiveCompletionHandler:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "completeTransition:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_setAnimator:", 0);
}

uint64_t __45___UIAnimationCoordinator_animateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 48);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v2 + 16), "__runAlongsideAnimations");
}

uint64_t __45___UIAnimationCoordinator_animateTransition___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endDisablingInterfaceAutorotation");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
