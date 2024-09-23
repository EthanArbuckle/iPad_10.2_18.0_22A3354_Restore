@implementation UIViewController(IC)

- (BOOL)ic_isViewVisible
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(a1, "_appearState") != 3;
  else
    v4 = 0;

  return v4;
}

- (id)ic_safeAreaLayoutGuide
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeAreaLayoutGuide");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)ic_performBlockAfterActiveTransition:()IC
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);

  v4 = a3;
  objc_msgSend(a1, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "transitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__UIViewController_IC__ic_performBlockAfterActiveTransition___block_invoke;
    v7[3] = &unk_1E5C1EAE8;
    v8 = v4;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v7);

  }
  else
  {
    v4[2](v4);
  }

}

- (uint64_t)ic_isBeingRevealedFromPoppingViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;

  objc_msgSend(a1, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

  }
  else
  {
    v7 = 1;
  }
  objc_msgSend(a1, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(a1, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "modalPresentationStyle") == 7)
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(a1, "presentedViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "modalPresentationStyle") == 1;

    }
  }

  if (v9 == a1)
    v14 = v7;
  else
    v14 = 1;
  if ((v14 & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(a1, "presentedViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v15 = v11;
    else
      v15 = 1;

  }
  return v15;
}

- (id)ic_windowScene
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (double)ic_safeAreaDistanceFromTop
{
  void *v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGRect v11;

  objc_msgSend(a1, "ic_safeAreaLayoutGuide");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v11.origin.x = v3;
  v11.origin.y = v5;
  v11.size.width = v7;
  v11.size.height = v9;
  return CGRectGetMinY(v11);
}

- (double)ic_safeAreaDistanceFromBottom
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double MaxY;
  double v13;
  CGRect v15;
  CGRect v16;

  objc_msgSend(a1, "ic_safeAreaLayoutGuide");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(a1, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  MaxY = CGRectGetMaxY(v15);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  v13 = MaxY - CGRectGetMaxY(v16);

  return v13;
}

- (id)ic_viewControllerManager
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  v4 = MEMORY[0x1E0C809B0];
  performBlockOnMainThreadAndWait();
  v1 = (void *)v7[5];
  if (v1)
  {
    objc_msgSend(v1, "ic_viewControllerManager", v4, 3221225472, __48__UIViewController_IC__ic_viewControllerManager__block_invoke, &unk_1E5C1D9D0, a1, &v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  _Block_object_dispose(&v6, 8);

  return v2;
}

- (uint64_t)ic_isRTL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ic_isRTL");

  return v2;
}

+ (void)ic_enableUIViewAnimations:()IC forBlock:
{
  uint64_t v5;
  uint64_t v6;
  void (**v7)(void);

  v7 = a4;
  v5 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  if ((_DWORD)v5 == (_DWORD)a3)
  {
    v7[2]();
  }
  else
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", a3);
    v7[2]();
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", v6);
  }

}

- (void)ic_showViewController:()IC animated:sender:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_opt_class();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__UIViewController_IC__ic_showViewController_animated_sender___block_invoke;
  v13[3] = &unk_1E5C1D7C0;
  v13[4] = a1;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "ic_enableUIViewAnimations:forBlock:", a4, v13);

}

- (uint64_t)ic_behavior
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ic_behavior");

  return v2;
}

- (uint64_t)ic_showSingleButtonAlertWithTitle:()IC message:
{
  return objc_msgSend(a1, "ic_showSingleButtonAlertWithTitle:message:handler:", a3, a4, 0);
}

- (void)ic_showSingleButtonAlertWithTitle:()IC message:handler:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  if ((unint64_t)objc_msgSend(v18, "length") < 0xC9)
  {
    v13 = v18;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v18, "substringToIndex:", 200);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@…"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v12;
  }
  v19 = v13;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v13, v8, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAction:", v17);
  objc_msgSend(a1, "presentViewController:animated:completion:", v14, 1, 0);

}

- (id)ic_topViewController
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    do
    {
      objc_msgSend(v1, "presentedViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "presentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = v3;
    }
    while (v4);
  }
  else
  {
    v3 = v1;
  }
  return v3;
}

- (id)ic_embedInNavigationControllerForModalPresentation
{
  void *v1;
  uint64_t v2;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", a1);
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    v2 = 1;
  else
    v2 = 2;
  objc_msgSend(v1, "setModalPresentationStyle:", v2);
  return v1;
}

- (id)ic_rootNavigationController
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    do
    {
      objc_msgSend(v1, "navigationController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = v3;
    }
    while (v4);
  }
  else
  {
    v3 = v1;
  }
  return v3;
}

- (id)ic_window
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)ic_hasFullScreenModalPresentationStyle
{
  return !objc_msgSend(a1, "modalPresentationStyle") || objc_msgSend(a1, "modalPresentationStyle") == 5;
}

- (void)ic_dismissViewControllerOfClass:()IC animated:completion:
{
  id v8;
  char isKindOfClass;
  void *v10;
  int v11;
  _QWORD v12[5];

  v8 = a5;
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(a1, "childViewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__UIViewController_IC__ic_dismissViewControllerOfClass_animated_completion___block_invoke;
  v12[3] = &__block_descriptor_40_e33_B32__0__UIViewController_8Q16_B24lu32l8;
  v12[4] = a3;
  v11 = objc_msgSend(v10, "ic_containsObjectPassingTest:", v12);

  if ((isKindOfClass & 1) != 0 || v11)
    objc_msgSend(a1, "dismissViewControllerAnimated:completion:", a4, v8);

}

- (void)ic_dismissPresentedViewControllerAnimated:()IC completion:
{
  void *v6;
  void (**v7)(void);

  v7 = a4;
  objc_msgSend(a1, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(a1, "dismissViewControllerAnimated:completion:", a3, v7);
  else
    v7[2]();

}

- (void)ic_replacePresentedViewControllerWithViewController:()IC animated:completion:
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  char v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__UIViewController_IC__ic_replacePresentedViewControllerWithViewController_animated_completion___block_invoke;
  v12[3] = &unk_1E5C1EAC0;
  v12[4] = a1;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a1, "ic_dismissPresentedViewControllerAnimated:completion:", a4, v12);

}

@end
