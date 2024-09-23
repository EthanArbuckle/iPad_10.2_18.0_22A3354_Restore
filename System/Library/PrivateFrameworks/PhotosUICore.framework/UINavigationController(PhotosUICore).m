@implementation UINavigationController(PhotosUICore)

- (BOOL)px_preparePopToViewController:()PhotosUICore forced:
{
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  _BOOL8 v11;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v7 = a3;
  objc_msgSend(a1, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "viewControllers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UINavigationController+PhotosUICore.m"), 24, CFSTR("Trying to pop to a view controller %@ that isn't in the view controllers of %@: %@"), v7, a1, v14);

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v10 = MEMORY[0x1E0C809B0];
  if ((a4 & 1) != 0)
    goto LABEL_5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__UINavigationController_PhotosUICore__px_preparePopToViewController_forced___block_invoke;
  v17[3] = &unk_1E513CE20;
  v18 = v7;
  v19 = &v20;
  objc_msgSend(a1, "px_enumerateDescendantViewControllersWithOptions:usingBlock:", 2, v17);

  if (*((_BYTE *)v21 + 24))
  {
LABEL_5:
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __77__UINavigationController_PhotosUICore__px_preparePopToViewController_forced___block_invoke_2;
    v15[3] = &unk_1E513CE48;
    v16 = v7;
    objc_msgSend(a1, "px_enumerateDescendantViewControllersWithOptions:usingBlock:", 2, v15);

    v11 = *((_BYTE *)v21 + 24) != 0;
  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v11;
}

- (id)px_popToViewControllerPrecedingViewController:()PhotosUICore animated:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a1, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v6);

  v9 = 0;
  if (v8 && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v8 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "popToViewController:animated:", v10, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (uint64_t)px_pushViewController:()PhotosUICore animated:completion:
{
  void *v8;
  id v9;
  id v10;

  v8 = (void *)MEMORY[0x1E0CD28B0];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v9);

  objc_msgSend(a1, "pushViewController:animated:", v10, a4);
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (id)px_childViewControllersForModalInPresentation
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "topViewController");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    v5[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

@end
