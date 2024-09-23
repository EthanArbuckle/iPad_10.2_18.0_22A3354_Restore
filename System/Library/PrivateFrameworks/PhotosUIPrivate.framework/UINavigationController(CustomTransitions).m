@implementation UINavigationController(CustomTransitions)

- (id)pu_currentNavigationTransition
{
  return objc_getAssociatedObject(a1, "com.apple.photosui.currentNavigationTransition");
}

- (void)pu_pushViewController:()CustomTransitions withTransition:animated:isInteractive:
{
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  id v15;

  v15 = a3;
  v10 = a4;
  objc_msgSend(v15, "pu_setNavigationTransition:", v10);
  objc_msgSend(v10, "setStartedInteractively:", a6);
  v11 = objc_msgSend(a1, "_useStandardStatusBarHeight");
  objc_msgSend(a1, "topViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "prefersStatusBarHidden");
  v14 = objc_msgSend(v15, "prefersStatusBarHidden");

  if (v13 == v14)
  {
    objc_msgSend(v10, "transitionWillStartOperation:animated:interactive:", 1, a5, a6);
    objc_msgSend(a1, "pushViewController:animated:", v15, a5);
    objc_msgSend(v10, "transitionDidStartOperation:animated:interactive:", 1, a5, a6);
  }
  else
  {
    objc_msgSend(a1, "_setUseStandardStatusBarHeight:", 1);
    objc_msgSend(v10, "transitionWillStartOperation:animated:interactive:", 1, a5, a6);
    objc_msgSend(a1, "pushViewController:animated:", v15, a5);
    objc_msgSend(v10, "transitionDidStartOperation:animated:interactive:", 1, a5, a6);
    objc_msgSend(a1, "_setUseStandardStatusBarHeight:", v11);
  }

}

- (uint64_t)pu_popViewControllerAnimated:()CustomTransitions interactive:
{
  return objc_msgSend(a1, "pu_popToViewController:animated:interactive:", 0, a3, a4);
}

- (void)pu_popToViewController:()CustomTransitions animated:interactive:
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  objc_msgSend(a1, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pu_navigationTransition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)a4)
    objc_msgSend(v9, "setStartedInteractively:", a5);
  objc_msgSend(v10, "transitionWillStartOperation:animated:interactive:", 2, a4, a5);
  if (v13)
    v11 = (id)objc_msgSend(a1, "popToViewController:animated:", v13, a4);
  else
    v12 = (id)objc_msgSend(a1, "popViewControllerAnimated:", a4);
  objc_msgSend(v10, "transitionDidStartOperation:animated:interactive:", 2, a4, a5);

}

- (id)pu_currentInteractiveTransition
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "topViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pu_currentInteractiveNavigationTransition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_pu_setCurrentNavigationTransition:()CustomTransitions
{
  objc_setAssociatedObject(a1, "com.apple.photosui.currentNavigationTransition", a3, (void *)0x301);
}

- (void)pu_navigationTransitionWillStart:()CustomTransitions
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "pu_currentNavigationTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UINavigationController+CustomTransitions.m"), 81, CFSTR("current navigation transition already exists"));

  }
  objc_msgSend(a1, "_pu_setCurrentNavigationTransition:", v7);

}

- (uint64_t)pu_navigationTransitionWillEnd:()CustomTransitions
{
  id v5;
  id v6;
  void *v8;

  v5 = a3;
  objc_msgSend(a1, "pu_currentNavigationTransition");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UINavigationController+CustomTransitions.m"), 86, CFSTR("unexpected current navigation transition"));

  }
  return objc_msgSend(a1, "_pu_setCurrentNavigationTransition:", 0);
}

@end
