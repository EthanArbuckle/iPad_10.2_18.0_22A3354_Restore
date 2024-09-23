@implementation UIViewController(PhotosUICore)

- (double)px_safeAreaInsets
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  if (objc_msgSend(a1, "isViewLoaded"))
  {
    objc_msgSend(a1, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safeAreaInsets");
    v4 = v3;

  }
  else
  {
    v4 = *MEMORY[0x1E0DC49E8];
  }
  +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simulatedSafeAreaHorizontalInsets");
  v7 = v6;

  if (v7 > 0.0)
  {
    objc_msgSend(a1, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "horizontalSizeClass");

  }
  return v4;
}

- (double)px_layoutMargins
{
  void *v2;
  double v3;
  double v4;

  if (!objc_msgSend(a1, "isViewLoaded"))
    return *MEMORY[0x1E0DC49E8];
  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutMargins");
  v4 = v3;

  return v4;
}

- (uint64_t)px_determinesPreferredStatusBarStyle
{
  return 0;
}

- (uint64_t)px_determinesPreferredStatusBarHidden
{
  return 0;
}

- (BOOL)px_isVisible
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (!objc_msgSend(a1, "isViewLoaded"))
    return 0;
  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (uint64_t)px_isDelayingPresentation
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "_isDelayingPresentation");
  else
    return 0;
}

- (id)px_topmostPresentedViewController
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "presentedViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
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

- (uint64_t)ppt_containedViewController
{
  return 0;
}

- (void)px_presentOverTopmostPresentedViewController:()PhotosUICore animated:completion:
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v8 = a5;
  v13 = a3;
  objc_msgSend(a1, "px_topmostPresentedViewController");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = a1;
  v12 = v11;

  objc_msgSend(v12, "presentViewController:animated:completion:", v13, a4, v8);
}

- (uint64_t)px_dismissViewControllerIfAllowedAnimated:()PhotosUICore forced:
{
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  char v13;
  uint64_t v14;

  objc_msgSend(a1, "presentedViewController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v12 = 0;
LABEL_15:
    objc_msgSend(a1, "dismissViewControllerAnimated:completion:", a3, 0);
    v14 = 1;
    goto LABEL_16;
  }
  v8 = (void *)v7;
  do
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(v8, "prepareForDismissingForced:", a4) | a4;
    else
      v9 = 1;
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v8, "setActive:", 0);
    objc_msgSend(v8, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = v9;
    else
      v13 = 0;
    v8 = v12;
  }
  while ((v13 & 1) != 0);
  if (v9)
    goto LABEL_15;
  v14 = 0;
LABEL_16:

  return v14;
}

- (void)px_addOrReplaceChildViewController:()PhotosUICore activateConstraints:
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a1, "childViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIViewController+PhotosUICore.m"), 138, CFSTR("Only 0 or 1 child view controller is expected."));

  }
  objc_msgSend(a1, "childViewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "willMoveToParentViewController:", 0);
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    objc_msgSend(v11, "removeFromParentViewController");
  }
  objc_msgSend(a1, "addChildViewController:", v7);
  objc_msgSend(a1, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v13, "addSubview:", v14);
  if (a4)
  {
    v26 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v14, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v29;
    objc_msgSend(v14, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v25;
    objc_msgSend(v14, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v15;
    objc_msgSend(v14, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v19);

  }
  else
  {
    objc_msgSend(v13, "bounds");
    objc_msgSend(v14, "setFrame:");
  }
  objc_msgSend(v7, "didMoveToParentViewController:", a1);
  objc_msgSend(v7, "contentScrollViewForEdge:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentScrollViewForEdge:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setContentScrollView:forEdge:", v20, 1);
  objc_msgSend(a1, "setContentScrollView:forEdge:", v21, 4);

}

- (PXStatusBarHiddenViewController)px_createViewControllerWithHiddenStatusBarForMainViewController:()PhotosUICore
{
  PXStatusBarHiddenViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v3 = objc_alloc_init(PXStatusBarHiddenViewController);
  -[PXStatusBarHiddenViewController addChildViewController:](v3, "addChildViewController:", v27);
  objc_msgSend(v27, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXStatusBarHiddenViewController view](v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  v19 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v4, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStatusBarHiddenViewController view](v3, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  objc_msgSend(v4, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStatusBarHiddenViewController view](v3, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v18;
  objc_msgSend(v4, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStatusBarHiddenViewController view](v3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v8;
  objc_msgSend(v4, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStatusBarHiddenViewController view](v3, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v13);

  objc_msgSend(v27, "didMoveToParentViewController:", a1);
  objc_msgSend(v27, "contentScrollViewForEdge:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "contentScrollViewForEdge:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStatusBarHiddenViewController setContentScrollView:forEdge:](v3, "setContentScrollView:forEdge:", v14, 1);
  -[PXStatusBarHiddenViewController setContentScrollView:forEdge:](v3, "setContentScrollView:forEdge:", v15, 4);

  return v3;
}

- (uint64_t)px_canPresentViewControllerAnimated:()PhotosUICore
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if ((_DWORD)a3 && !objc_msgSend(a1, "px_isVisible"))
    return 0;
  objc_msgSend(a1, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || (objc_msgSend(v5, "isBeingDismissed") & 1) != 0
    || (objc_msgSend(a1, "navigationItem"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "searchController"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v6 == v8))
  {

    goto LABEL_10;
  }
  if ((objc_msgSend(a1, "_mayForwardPresentationsToPresentedViewController") & 1) == 0)
  {
    v10 = 0;
LABEL_14:

    return v10;
  }
  v9 = objc_msgSend(v6, "px_canPresentViewControllerAnimated:", a3);

  if (v9)
  {
LABEL_10:
    objc_msgSend(a1, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (v11)
    {
      objc_msgSend(v11, "topViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(a1, "px_isDescendantOfViewController:", v12);

    }
    else
    {
      v10 = 1;
    }
    goto LABEL_14;
  }
  return 0;
}

- (BOOL)px_isDescendantOfViewController:()PhotosUICore
{
  id v4;
  id v5;
  id v6;
  _BOOL8 i;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v5 = a1;
    v6 = v5;
    for (i = v5 != 0; v6 != v4 && v6; i = v6 != 0)
    {
      v8 = v6;
      objc_msgSend(v6, "parentViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    i = 0;
  }

  return i;
}

- (BOOL)px_isDescendantOfOrPresentedByViewController:()PhotosUICore
{
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v5 = a1;
  v6 = v5;
  v7 = v5 != 0;
  if (v5 == v4 || !v5)
  {
    v11 = v5;
  }
  else
  {
    do
    {
      objc_msgSend(v6, "parentViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        objc_msgSend(v6, "presentingViewController");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;

      v7 = v11 != 0;
      if (v11 == v4)
        break;
      v6 = v11;
    }
    while (v11);
  }

  return v7;
}

- (void)px_enumerateDescendantViewControllersWithOptions:()PhotosUICore usingBlock:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", a1);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "childViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v7);

  objc_msgSend(a1, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == a1)
    {
      v11 = objc_msgSend(v13, "containsObject:", v9);

      if ((v11 & 1) == 0)
        objc_msgSend(v13, "addObject:", v9);
    }
    else
    {

    }
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__UIViewController_PhotosUICore__px_enumerateDescendantViewControllersWithOptions_usingBlock___block_invoke;
  v14[3] = &unk_1E512DA98;
  v14[4] = a1;
  v15 = v6;
  v16 = a3;
  v12 = v6;
  objc_msgSend(v13, "enumerateObjectsWithOptions:usingBlock:", a3, v14);

}

- (id)px_descendantViewControllerWithClass:()PhotosUICore
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__146911;
  v10 = __Block_byref_object_dispose__146912;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__UIViewController_PhotosUICore__px_descendantViewControllerWithClass___block_invoke;
  v5[3] = &unk_1E512DAC0;
  v5[4] = &v6;
  v5[5] = a3;
  objc_msgSend(a1, "px_enumerateDescendantViewControllersWithOptions:usingBlock:", 0, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)px_subtitle
{
  return objc_getAssociatedObject(a1, (const void *)PXSubtitleAssociationKey);
}

- (void)px_setSubtitle:()PhotosUICore
{
  objc_setAssociatedObject(a1, (const void *)PXSubtitleAssociationKey, a3, (void *)3);
}

- (id)px_previewActionMenus
{
  return objc_getAssociatedObject(a1, (const void *)PXPreviewActionMenusKey);
}

- (void)px_setPreviewActionMenus:()PhotosUICore
{
  objc_setAssociatedObject(a1, (const void *)PXPreviewActionMenusKey, a3, (void *)3);
}

- (id)px_previousViewControllerInNavigationController
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(objc_msgSend(v3, "indexOfObject:", a1) - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)px_nextViewControllerInNavigationController
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "indexOfObject:", a1);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (v5 = v4 + 1, v4 + 1 >= (unint64_t)objc_msgSend(v3, "count")))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (uint64_t)px_setModalInPresentation:()PhotosUICore
{
  uint64_t result;

  result = objc_msgSend(a1, "isModalInPresentation");
  if ((_DWORD)result != (_DWORD)a3)
  {
    objc_msgSend(a1, "setModalInPresentation:", a3);
    return objc_msgSend(a1, "px_containedViewControllerModalStateChanged");
  }
  return result;
}

- (uint64_t)px_containsViewControllerModalInPresentation
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "isModalInPresentation") & 1) != 0)
    return 1;
  objc_msgSend(a1, "px_childViewControllersForModalInPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PXExists();

  return v4;
}

- (void)px_containedViewControllerModalStateChanged
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(a1, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "presentingViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(v5, "px_containedViewControllerModalStateChanged");
}

- (void)px_adjustAdditionalSafeAreaInsetsToKeepContentStableRegardlessOfStatusBarVisibility
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  double (**v7)(_QWORD);
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD aBlock[5];

  +[PXWorkaroundSettings sharedInstance](PXWorkaroundSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldWorkAround128269285");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom") == 1)
    {
      objc_msgSend(a1, "presentingViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __117__UIViewController_PhotosUICore__px_adjustAdditionalSafeAreaInsetsToKeepContentStableRegardlessOfStatusBarVisibility__block_invoke;
    aBlock[3] = &unk_1E512DE90;
    aBlock[4] = a1;
    v7 = (double (**)(_QWORD))_Block_copy(aBlock);
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v11 = 0.0;
    if (v6)
    {
      if (objc_msgSend(a1, "prefersStatusBarHidden"))
        v11 = v7[2](v7);
    }
    objc_msgSend(a1, "setAdditionalSafeAreaInsets:", v11, v8, v9, v10);

  }
}

- (uint64_t)debugURLsForDiagnostics
{
  return MEMORY[0x1E0C9AA60];
}

+ (_PXFrozenViewController)px_freezeViewController:()PhotosUICore timeout:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _PXFrozenViewController *v11;
  dispatch_time_t v12;
  _PXFrozenViewController *v13;
  _QWORD block[4];
  _PXFrozenViewController *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_firstKeyWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v18 = v6;
    v19 = 2048;
    v20 = a1;
    v21 = 2048;
    v22 = v8;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_INFO, "Freezing window: %p timeout: %f snapshot: %p", buf, 0x20u);
  }

  objc_msgSend(v8, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setZPosition:", 1.79769313e308);

  objc_msgSend(v6, "addSubview:", v8);
  v11 = -[_PXFrozenViewController initWithSnapshotView:]([_PXFrozenViewController alloc], "initWithSnapshotView:", v8);
  v12 = dispatch_time(0, (uint64_t)(a1 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__UIViewController_PhotosUICore__px_freezeViewController_timeout___block_invoke;
  block[3] = &unk_1E5149198;
  v13 = v11;
  v16 = v13;
  dispatch_after(v12, MEMORY[0x1E0C80D38], block);

  return v13;
}

@end
