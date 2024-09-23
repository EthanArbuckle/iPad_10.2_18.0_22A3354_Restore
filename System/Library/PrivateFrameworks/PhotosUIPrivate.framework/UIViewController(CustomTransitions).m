@implementation UIViewController(CustomTransitions)

- (id)pu_navigationTransition
{
  return objc_getAssociatedObject(a1, "com.apple.photosui.navigationTransition");
}

- (id)pu_modalTransition
{
  return objc_getAssociatedObject(a1, "com.apple.photosui.modalTransition");
}

- (void)pu_setModalTransition:()CustomTransitions
{
  objc_setAssociatedObject(a1, "com.apple.photosui.modalTransition", a3, (void *)1);
}

- (void)pu_setNavigationTransition:()CustomTransitions
{
  objc_setAssociatedObject(a1, "com.apple.photosui.navigationTransition", a3, (void *)1);
}

- (void)pu_removeNavigationTransition
{
  id v2;

  objc_msgSend(a1, "pu_navigationTransition");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "com.apple.photosui.previousNavigationTransition", v2, (void *)1);
  objc_msgSend(a1, "pu_setNavigationTransition:", 0);

}

- (void)pu_restoreNavigationTransition
{
  id v2;

  objc_getAssociatedObject(a1, "com.apple.photosui.previousNavigationTransition");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pu_setNavigationTransition:", v2);

}

- (id)pu_currentInteractiveModalTransition
{
  void *v1;

  objc_msgSend(a1, "pu_modalTransition");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isInteractive") & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

- (id)pu_currentInteractiveNavigationTransition
{
  void *v1;

  objc_msgSend(a1, "pu_navigationTransition");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isInteractive") & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

- (void)pu_presentViewController:()CustomTransitions transition:animated:interactive:completion:
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v13 = a7;
  v14 = a4;
  v17 = a3;
  objc_msgSend(v17, "transitioningDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIViewController+CustomTransitions.m"), 72, CFSTR("expected no transitioningDelegate"));

  }
  objc_msgSend(v17, "setTransitioningDelegate:", v14);
  objc_msgSend(v17, "pu_setModalTransition:", v14);
  objc_msgSend(v14, "setStartedInteractively:", a6);

  objc_msgSend(a1, "presentViewController:animated:completion:", v17, a5, v13);
}

- (void)pu_dismissViewControllerAnimated:()CustomTransitions interactive:completion:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a5;
  objc_msgSend(a1, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pu_modalTransition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)a3)
    objc_msgSend(v10, "setStartedInteractively:", a4);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__UIViewController_CustomTransitions__pu_dismissViewControllerAnimated_interactive_completion___block_invoke;
  v15[3] = &unk_1E58ABAF0;
  v16 = v11;
  v17 = v9;
  v18 = v8;
  v12 = v8;
  v13 = v9;
  v14 = v11;
  objc_msgSend(a1, "dismissViewControllerAnimated:completion:", a3, v15);

}

@end
