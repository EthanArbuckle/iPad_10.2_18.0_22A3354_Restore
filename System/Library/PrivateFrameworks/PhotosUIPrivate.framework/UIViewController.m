@implementation UIViewController

void __97__UIViewController_PUNavigationController_Private__ppt_performBlockAfterNextNavigationAnimation___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__UIViewController_PUNavigationController_Private__ppt_performBlockAfterNextNavigationAnimation___block_invoke_2;
  block[3] = &unk_1E58ABAC8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __97__UIViewController_PUNavigationController_Private__ppt_performBlockAfterNextNavigationAnimation___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__UIViewController_PUNavigationController_Private__ppt_performBlockAfterNextNavigationAnimation___block_invoke_3;
  block[3] = &unk_1E58ABAC8;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __97__UIViewController_PUNavigationController_Private__ppt_performBlockAfterNextNavigationAnimation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__UIViewController_CustomTransitions__pu_dismissViewControllerAnimated_interactive_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitionWasCancelled");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "transitioningDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);

    if (v4 == v5)
      objc_msgSend(*(id *)(a1 + 40), "setTransitioningDelegate:", 0);
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __82__UIViewController_PhotosUI___pu_setNavigationBarTintColor_withAnimationSettings___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setTintColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3A28], "appearance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tintColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTintColor:", v2);

  }
}

uint64_t __81__UIViewController_PhotosUI___pu_updateStatusBarVisibilityWithAnimationSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

void __59__UIViewController_PhotosUI__pu_currentViewControllerStack__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_firstKeyWindow");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pu_currentViewControllerStack_window;
  pu_currentViewControllerStack_window = v0;

}

@end
