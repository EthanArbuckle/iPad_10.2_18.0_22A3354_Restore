@implementation TVPlaybackFadeAnimator

uint64_t __45___TVPlaybackFadeAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

uint64_t __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 40), "setHidden:", 0);
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDF6F90];
    v5 = *(double *)(a1 + 64);
    v6 = MEMORY[0x24BDAC760];
    v7 = (unint64_t)*(unsigned __int8 *)(a1 + 73) << 17;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke_3;
    v11[3] = &unk_24EB85440;
    v12 = *(id *)(a1 + 48);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke_4;
    v8[3] = &unk_24EB85FA0;
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v4, "animateWithDuration:delay:options:animations:completion:", v7, v11, v8, v5, 0.0);

  }
}

uint64_t __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
